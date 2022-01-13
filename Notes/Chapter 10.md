# Chapter 10 Agile Teams

### 10.1 It Takes a Team: Two-Pizza and Scrum

#### “two-pizza” team

a group that can be fed by two pizzas in a meeting(usually in saas project)

####  Scrum

one way to organize the "two-piazza" team

1. what have done yesterday
2. plan today
3. any impediment block

scrum uses sprint as instead of agile term iteration

3 role in a Scrum:1) Team: who delivers the software. 2)Scrum lead: buffer between team and external distractions. 3)Product owner: member who represents the voice of customer

For conflicts:1) list agreement for both sides-->closer than they though

2)articulate other's argument-->reduce confusion

Scrum relies more on real-time feedback than on the traditional management approach of central planning with command and control.

### 10.2 Using Branches Effectively 

#### feature branch

It allows a developer or sub-team to make the changes necessary to implement a particular feature without affecting the main branch until the changes are complete and tested

create a new branch for a new feature

(use branch only needed for that feature)

To back out feature, undo branch merge

1. Create new branch & switch to it
2. Edit on the branch
3. Push branch to origin repo
4. Merge branch to master

Each new feature should reside in its own branch, which can be pushed to the central repository for backup/collaboration. But, instead of branching off of `main`, `feature` branches use `develop` as their parent branch. When a feature is complete, it gets merged back into develop. Features should never interact directly with `main`.

![image-20211126214751976](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211126214751976.png)

#### Release branch

![image-20211126214515469](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211126214515469.png)



#### Pull

When you make pull request, you are making it with the branch that already been rebased

#### Merge Conflict

If 2 person(A,B) have different branches, and the A has merged to the master branch. If A,B change the same file. Then B can't push directly to the master. B can use git pull origin main to get the latest commits on main from the origin repo. So B's copy of repo looks the same as it did to A.

B and A have their own local master.  Run git pull origin main update B's local master(the master after merge of A).

If B changes different file than A or different place in the same file, B can merge directly.

Otherwise, git will create a version of the file that reflects both sets of changes, and it will leave a conflicted and uncommitted version of the file with conflict markers (<<< and >>>) in B’s main branch. Then B will manually edit to complete the merge 

```
          I--J   <-- branch1 (HEAD)
         /
...--G--H
         \
          K--L   <-- branch2
Here, when merging branch1 and branch2—which means commits J and L—the common starting point is clearly commit H. So git merge will run two git diff commands, and the merge base in each will be H
Git will now combine the set of changes produced by these two git diff commands. Where they overlap, but don't make the same change, is where you will get merge conflicts
```



### 10.3 Pull Requests and Code Reviews 

#### Pull Request

Pull requests are a mechanism for a developer to notify team members that they have completed a feature. It expects other team member to review and comment on it. PR may be withdraw or revised before merge.

But, the pull request is more than just a notification—it’s a dedicated forum for discussing the proposed feature. If there are any problems with the changes, teammates can post feedback in the pull request and even tweak the feature by pushing follow-up commits. All of this activity is tracked directly inside of the pull request.

All developers Merge request is an alternative name for pull request. sharing the repo see each PR, and each has the responsibility to determine how merging those changes might affect their own code

The PR’s “description” field should provide a well-written explanation of what the proposed code does overall

#### PR description

1. The code to be merged should be well covered by tests, all of which should be passing

2.  The commit messages should clearly indicate what was changed in each commit
3. Documentation has been updated if necessary to explain new design decisions or changes to important configuration files
4. Any temporary or non-essential files that were versioned during development of the code have been removed from version control
5. Steps have been taken to eliminate or minimize merge conflicts that will occur when the PR is accepted and merged

#### Rebase

The first thing to understand about `git rebase` is that it solves the same problem as `git merge`. Both of these commands are designed to integrate changes from one branch into another branch

happens when you want merge you branch to master but the master is in another version

As the branch owner, I take the responsibility to make sure when merging the master, it's clean. To achieve this, first rebase the latest master, do the clean up then merge.

```
$ git checkout experiment
$ git rebase master // rebase the change on experiment to master
$ git checkout master
$ git merge experiment // do the merge on master
```

![image-20211126213549473](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211126213549473.png)

you can take the patch of the change that was introduced in `C4` and reapply it on top of `C3`. In Git, this is called *rebasing*. With the `rebase` command, you can take all the changes that were committed on one branch and replay them on a different branch.

For example, if there have been 3 new commits on main since the time you branched off of it, and you now rebase your branch on top of main, Git will first apply those 3 new commits to the original state of your branch, and then try to apply your own commits. This latter step may cause conflicts if the 3 commits on the main branch touched some of the same files your changes have touched

##### rewriting of history

1.You have not yet pushed to the shared repo

2.You have pushed to the shared repo, but no one else has made additional changes based on your branch

3.You have pushed to the shared repo, and others have based work off of your changes

For case 3, one good practice is to construct feature branch names in some way that signals that others should not build off of those commits

### 10.4 Delivering the Backlog Using Continuous Integration

#### Automation

consistent deploy process

#### Continuous Integration

integration-testing the app beyond what each developer does

It allows developers to frequently merge code changes into a central repository where builds and tests then run. Automated tools are used to assert the new code’s correctness before integration.

Central to CI is the continuous running of tests as code is developed, usually using a separate service such as Travis

#### Continuous Deployment

Push->pass CI->Deploy

#### Basic Workflow

1. use git pull to make sure your local get the most up-to-date copy
2. create a feature branch
3. make commits to your feature branch. Periodically push you commits on a branch of origin repo(origin repo is set up to run a CI test for every commits to the master or branch)
4. ask for permission to merge to the master branch. Starts with a PR(the pull request is comparing the feature branch on the origin repo to the master branch on the origin repo)
5. give feedback
6. make more commits and make PR
7. Fix all the issues and PR is accepted. Merge with the master
8. Deploy new merged code in a staging server(like a small version of production server). Listen to customer's request and make more commits and make PR and finish
9. use git pull to make local repo up-to-date

![image-20211127110109294](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211127110109294.png)

delivered: deploy on staging server

accepted: deploy on production server

If the team doesn't own the app, we need variations

![image-20211127111015762](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211127111015762.png)

#### Minimize Loops

small stories->simple branch->quick PR

work on stories on prioritized order

one story at a time

### 10.6 Reporting and Fixing Bugs: The Five R’s 

#### 5 Rs

1. Reporting a bug(maybe found by customer or your team. Many bug tracker can cross-reference commit-IDs that contain the associated fixes and regression tests)
2. Reproducing the problem, or else Reclassifying it as “not a bug” or “won’t be fixed”(reproduce it with simplest test. make the precondition as small as possible,before block in RSPEC)
3. Creating a Regression test that demonstrates the bug
4. Repairing the bug(no bug can be closed out without a test)
5. Releasing the repaired code

Even non-agile do something like this

#### Reclassify(4 cases)

This is not a bug but a request to make an enhancement or change a behavior that is working as designed 

This bug is in a part of the code that is being undeployed or is otherwise no longer supported 

This bug occurs only with an unsupported user environment, such as a very old browser lacking necessary features for this SaaS app 

This bug is already fixed in the latest version (uncommon in SaaS, whose users are always using the latest version)

#### Pivotal Tracker

bug = 0 point story

automation: Github service hooks can be configured to mark Tracker story deliverd when properly-annotated commit is pushed

![image-20211127112439380](C:\Users\Eric Zheng\AppData\Roaming\Typora\typora-user-images\image-20211127112439380.png)

### 10.7 The Plan-And-Document Perspective on Managing Teams 

Project manager takes charge of P&D documentation

#### Review Agenda

Prepare questions to be discussed->starts with high level description of customer need->give SW architecture showing APIs and highlighting design pattern at each level of abstraction->go through code and documentation

####  four major tasks for project managers

1. Team size, roles, space, communication 
2. Managing people and conflicts 
3. Inspections and metrics 
4. Configuration management

#### Inspection and metrics

Inspections like design reviews and code reviews allow feedback on the system even before everything is working

#### Configuration management

Configuration management includes four varieties of changes

1. version control or source and configuration management (SCM)
2. system building, is closely related to the first. Tools like make assemble the compatible versions of components into an executable program for the target system
3. release management
4. change management, which comes from change requests made by customers and other stakeholders to fix bugs or to improve functionality

#### SAMOSAS

good meeting

S: start and stop meeting promptly

A: agenda created in advance

M: minutes recorded

O: one speaker at a time

S: send material in advance 

A: action items in the end so everybody knows what's their job

S: set time for next meeting

### 10.8 Fallacies and Pitfalls 

### 10.9 Concluding Remarks: From Solo Developer to Teams of Teams 