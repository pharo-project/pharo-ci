A CIAbstractChangeProvider is an API than you have to use with an issue provider.

Description : 

The IssueChecker communicates with an issue source to get sources that can be loaded or validated.
It give to the manager the way to download changesets. Example, in case of the changeset is from the fogbugz tracker, we have to know how to fetch by autentification protocol from the tracker.
I also contain publishers needed for the manager. (See CI-Core-Publishing for available publisher)

ChangeProvider contain Change than we will work with.

changeWithId: gives you the Change