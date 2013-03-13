private
refreshProjects
	| newProjects |

	newProjects := self getAllProjects.
	projects := newProjects