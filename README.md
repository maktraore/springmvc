Instructions - Coding Assignment Submissions to GitLab:
======================================================

#1) Create a local git_local folder

#2) Open Git Bash inside git_local

In Git Bash...

	> $ git clone https://git.fdmgroup.com/N-19-JAV-06/java3-springmvc.git

	> $ ls #to check for existence of local repository directory: java3-springmvc

	> $ cd java3-springmvc

	> $ ls - a #to check for existence of hidden file .gitignore inside the java3-springmvc directory.

#3) If .gitignore is not found, copy the version that is attached in the email into the java3-springmvc directory. Then rename, best to do in GIT bash:

	> $ mv ATT07960.gitignore .gitignore

#4) Copy your_eclipse_project from your Eclipse workspace into the java3-springmvc directory.

	> $ git checkout -b your_branch_name

	> $ git status #check that your project is visible for adding.

	> $ git add your_eclipse_project

	> $ git commit -m 'Assignment submission.'

	> $ git push origin your_branch_name