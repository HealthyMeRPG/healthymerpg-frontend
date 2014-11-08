`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

DashboardRoute = Ember.Route.extend(AuthenticatedRouteMixin, {
  queryParams: {
    date: {
      refreshModel: true
    }
  }

  model: (params, transition, queryParams) ->
    Ember.$.getJSON('/api/v1/dashboard/metrics', date: params.currentDate)
})

`export default DashboardRoute`
