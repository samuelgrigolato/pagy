
###
This module is responsible
for presenting the user page
###


class PageModel extends Backbone.Model

  defaults:
    
    ###
    Collection of root
    rows of this page. Each
    row can contain one
    or more columns
    ###
    "rows": []

  initialize: () ->
    @set "rows", [ new Pagy.RowModel ]



class PageView extends Backbone.View

  tagName: "div"
    
  className: "page"
    
  initialize: () ->  
    @model = @model || new PageModel
    @render()
    
    
  render: () ->    
    @$el.empty()
    @_renderRow row for row in @model.get "rows"


  _renderRow: (row) ->    
    rowView = new Pagy.RowView { model: row }    
    rowView.render()    
    @$el.append rowView.$el  



# exports
window.Pagy = window.Pagy || {}
window.Pagy.PageModel = PageModel
window.Pagy.PageView = PageView
