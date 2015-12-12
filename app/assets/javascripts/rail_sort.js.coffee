$ ->
  $('.rail-sortable').sortable
      axis: 'x,y'
      items: '.item'

      update: (e, ui) ->
        item = ui.item
        item_data = item.data()
        params = { _method: 'patch'}
        params[item_data.modelName] = { row_order_position: item.index() }
        $.ajax
          type: 'POST'
          url: item_data.updateUrl
          dataType: 'json'
          data: params
      stop: (e, ui) ->
        ui.item.children('.target, .target-done, .task, .task-done, .todo, .todo-done').effect('highlight')