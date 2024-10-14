# savage_client

The client Flutter application for Savage Coworking

### Authentication Providers

- [x] email
- [ ] phone
- [ ] Apple
- [ ] Google
- [ ] Github

## Services

For clarity and scalability we use two types of service classes.

- Dependency wrappers: Services that wrap a dependency so in case we want to
  switch dependency we can do so easily without having to worry our app will not
  work anymore.
- App services: The actual service the app uses to do it's job.

For example: The `firebase_auth` package is wrapped in the
`AuthenticationService`. And the `UserService` class uses this
`AuthenticationService` to make calls to the FirebaseAuth.instance.

## Views and ViewModels
