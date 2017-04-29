#' Generate test data
#'
#' @export
generate_test_data <- function() {
  
  v <- 1:4
  names(v) <- paste0("cat_", 1:4)
  
  cats <- paste0("category ", letters)
  
  get_random <- function(x) {
    paste0(rep("",8), cats[1:x])
  }
  
  df <- v %>% 
    purrr::map(get_random) %>% 
    tibble::as_data_frame()
  
  df["val"] <- runif(4)*100
  
  df
}
generate_test_data()
#' Convert data into format required for d3 vis
#'
#' @export
wide_to_long_hierarchy <- function(df, hierarchy_names, value_column) {
  
  output_df <- tibble::data_frame("id"=integer(), "parent"=integer(), "text"=character(), "value"=double(), level=integer())
  initial_row <- tibble::data_frame("id"=1, "parent"= NA, "text"="all", "value"=sum(df[value_column]), level=0)
  output_df <- dplyr::bind_rows(output_df, initial_row)
  
  already_exists <- function(cat_text, parent_id) {
    
    rows <- output_df %>% 
      dplyr::filter(text == get("cat_text")) %>%
      dplyr::filter(parent == get("parent_id"))
    
    nrows <- nrow(rows)
    
    if (nrows == 0) {
      return(FALSE)
    } else if (nrows == 1) {
      return(TRUE)
    } else {
      stop("Something's wrong - there are multiple rows at the same level")
    }
    
  }
  
  get_id <- function(text, level) {
    output_df %>% 
      dplyr::filter(text==get("text")) %>% 
      dplyr::filter(level== get("level")) %$% 
      id
  }
  
  add_row <- function(parent_id, text, value, level) {
    id <- nrow(output_df) + 1
    new_row <- tibble::data_frame("id"=id, "parent"=parent_id, "text"=text, "value"=value, "level"=level)
    output_df <<- dplyr::bind_rows(output_df, new_row)
    id
  }
  
  update_row <- function(parent_id, text, new_value, level) {
    
    f1 <- output_df["parent"] == parent_id
    f2 <- output_df["text"] == text
    f3 <- output_df["level"] == level
    
    output_df[f1 & f2 & f3,"value"] <<- output_df[f1 & f2 & f3,"value"] + new_value
    id <- output_df[f1 & f2 & f3,"id"]
    id[[1,1]]
    
  }
  
  for (i in 1:nrow(df)) {
    this_row <- as.list(df[i,])
    parent_id <- NULL
    
    for (n in hierarchy_names) {
      
      this_cat <- this_row[[n]]
      level <- match(n, hierarchy_names) # Level is the depth in the hierarchy
      
      # If last_name is null, we're in the first of the hierarchy names, which means there is no parent
      if (is.null(parent_id)) {
        parent_id <- 1
      } 
      
      exists <- already_exists(this_cat, parent_id)
      if (exists) {
        this_id <- update_row(parent_id, this_cat, this_row[[value_column]], level)
      } else {
        this_id <- add_row(parent_id, this_cat, this_row[[value_column]], level)
      }
      
      # Need to grab the ID of the row just created.
      parent_id <- this_id
      
    }
  }
  
  output_df %>% dplyr::select(-level)
}


