`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

DashboardRoute = Ember.Route.extend(AuthenticatedRouteMixin, {
  queryParams: {
    date: {
      refreshModel: true
    }
  }

  model: (params, transition, queryParams) ->
    date = params.currentDate
    date ||= moment().format("YYYY-MM-DD")

    @store.find('activity', { activity_date: date })

  afterModel: ->
    controller = @controllerFor('dashboard/index')
    if controller.get('scoreHistory').length == 0
      @store.find('score-history').then((scoreHistories) =>
        controller.set('scoreHistory', scoreHistories)
        return
      )

  setupController: (controller, model) ->
    @_super(controller, model.get('firstObject')) # get the first object because store.find() will return a promise array

    unless controller.get('quests')?
      controller.set('quests', @store.find('quest'))
})

`export default DashboardRoute`
