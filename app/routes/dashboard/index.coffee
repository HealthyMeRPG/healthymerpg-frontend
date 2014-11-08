`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

DashboardRoute = Ember.Route.extend(AuthenticatedRouteMixin, {
  queryParams: {
    date: {
      refreshModel: true
    }
  }

  model: (params, transition, queryParams) ->
    Ember.RSVP.hash(
      metrics: Ember.$.getJSON('/api/v1/dashboard/metrics', date: params.currentDate)
      quests: @store.find('quest')
    )
})

`export default DashboardRoute`
