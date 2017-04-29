HTMLWidgets.widget({

  name : 'hierarchicalbubble',  //This seems to need to match the name of the widget in htmlwidgets::createWidget
                                //see - https://github.com/ramnathv/htmlwidgets/blob/master/inst/www/htmlwidgets.js
  type : 'output',

  factory : function(el, width, height) {

    var elementId = el.id;
    var container = document.getElementById(elementId); //This is the DOM element wer're going to put the vis in
    var hierarchicalbubble = new HierarchicalBubble(container)
    
    return {

      renderValue: function(data_from_r) {  //This equates to a kind of 'update' method - what happens if we pass new data to the chart.  It will be called every time we change Shiny sliders etc.
        hierarchicalbubble.redraw(data_from_r)
      },

      resize : function(width, height) {
      }
   
    };
  }
});