Hierarchical bubble
===================

A hierarchical bubble chart HTML Widget for R implemented in d3v4.

This is work in progress, but you can find a working example of a Shiny
app [within the
repo](https://github.com/RobinL/hierarchical_bubble_r_html_widget/blob/master/example.R).

Instructions
------------

The widget expects data in the following format (showing first few rows
only):

<table>
<thead>
<tr class="header">
<th align="right">id</th>
<th align="right">parent</th>
<th align="left">text</th>
<th align="right">value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">1</td>
<td align="right">NA</td>
<td align="left">Total</td>
<td align="right">12129.736</td>
</tr>
<tr class="even">
<td align="right">2</td>
<td align="right">1</td>
<td align="left">category b</td>
<td align="right">2853.758</td>
</tr>
<tr class="odd">
<td align="right">3</td>
<td align="right">2</td>
<td align="left">category d</td>
<td align="right">2853.758</td>
</tr>
<tr class="even">
<td align="right">4</td>
<td align="right">3</td>
<td align="left">category g</td>
<td align="right">2853.758</td>
</tr>
<tr class="odd">
<td align="right">5</td>
<td align="right">4</td>
<td align="left">category l</td>
<td align="right">2853.758</td>
</tr>
<tr class="even">
<td align="right">6</td>
<td align="right">1</td>
<td align="left">category a</td>
<td align="right">9275.977</td>
</tr>
<tr class="odd">
<td align="right">7</td>
<td align="right">6</td>
<td align="left">category f</td>
<td align="right">9275.977</td>
</tr>
<tr class="even">
<td align="right">8</td>
<td align="right">7</td>
<td align="left">category i</td>
<td align="right">9275.977</td>
</tr>
<tr class="odd">
<td align="right">9</td>
<td align="right">8</td>
<td align="left">category j</td>
<td align="right">9275.977</td>
</tr>
</tbody>
</table>

However, you're more likely to have data that looks like this (first few
rows only):

<table>
<thead>
<tr class="header">
<th align="left">cat_1</th>
<th align="left">cat_2</th>
<th align="left">cat_3</th>
<th align="left">cat_4</th>
<th align="right">val</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">category b</td>
<td align="left">category e</td>
<td align="left">category g</td>
<td align="left">category l</td>
<td align="right">2339.0279</td>
</tr>
<tr class="even">
<td align="left">category b</td>
<td align="left">category f</td>
<td align="left">category i</td>
<td align="left">category j</td>
<td align="right">236.1685</td>
</tr>
<tr class="odd">
<td align="left">category a</td>
<td align="left">category f</td>
<td align="left">category g</td>
<td align="left">category j</td>
<td align="right">8579.5704</td>
</tr>
</tbody>
</table>

So a convenience function is provided that converts between the two:

    df <- hierarchicalbubble::generate_test_data()[1:5,]
    names <- paste0("cat_", 1:4)

    df_l <- hierarchicalbubble::wide_to_long_hierarchy(df,names, "val")

To see your visualisation use

    hierarchicalbubble::hierarchical_bubble(df_l)

Here's a screenshot of the widget embedded in a Shiny app:
![Screenshot](http://i.imgur.com/AdHQHtX.png)
