Meteor.publish 'my-actions', ->
  Actions.find 'is_show': false
