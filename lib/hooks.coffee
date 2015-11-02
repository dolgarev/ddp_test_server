return unless Meteor.isServer

Actions.before.insert (userId, doc) ->
  doc.created_at = Date.now()

Actions.before.update (userId, doc, fieldNames, modifier, options) ->
  modifier.$set = modifier.$set ? {}
  modifier.$set.updated_at = Date.now()
