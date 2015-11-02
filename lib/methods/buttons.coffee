Meteor.methods
  'buttons/add_number': (num) ->
    check num, Match.Where (num) ->
      check num, Match.Integer
      1 <= num <= 5

    Events.insert
      'event': 'buttons:add_click'
      'details':
        'number': num

  'actions/show_alert': (id) ->
    check id, Match.Where (id) ->
      check id, String
      0 < id.length < 24

    action = Actions.findOne id
    throw new Error 404, "Action ID ##{id} not exists" unless action?

    Actions.update id, $set: 'is_show': true
