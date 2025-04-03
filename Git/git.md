## What is HEAD in Git?

Where am I right now in the repository? It is a pointer to the currently checked-out branch or commit.

### Attached & detached state
HEAD pointer can be in either of two states: attached or detached. 

The default state is **attached**, where any manipulation of the history is automatically recorded to the branch HEAD is currently referencing. 

In a **detached** state, experimental changes can be made without impacting any existing branch, as HEAD is referencing the underlying commit directly and is not "attached" to a particular branch.

