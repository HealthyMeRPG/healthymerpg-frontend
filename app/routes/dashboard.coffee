`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

DashboardRoute = Ember.Route.extend(AuthenticatedRouteMixin, {
  model: ->
    Ember.$.getJSON('/api/v1/dashboard/metrics')
})

`export default DashboardRoute`
