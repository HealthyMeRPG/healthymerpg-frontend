`import Ember from 'ember'`
`import UnauthenticatedRouteMixin from 'simple-auth/mixins/unauthenticated-route-mixin'`

RegisterRoute = Ember.Route.extend(UnauthenticatedRouteMixin, {
  setupController: (controller, model) ->
    @_super.apply(@, arguments)

    # forces the errors array to be empty upon entering the route
    # this is done so that the failure state is not kept across
    # page transitions
    controller.set('errors', [])
})

`export default RegisterRoute`
