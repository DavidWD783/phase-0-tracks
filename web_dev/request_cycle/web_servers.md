#What are some of the key design philosophies of the Linux operating system?
##One driving factor behind building Unix in the late 60's was developers looking for an OS that was significantly different all other OS's in use at the time.  Linux is derived from this philosophy...
###The philosophy emphasizes "simple, short, clear, modular and extensible code" that is easy to maintain and can be refashioned by those other than its creators.
###The philosophy is in favor of composing as opposed to one design principle.
###The programs are meant to do one thing well.
###The output of one program is expected to be the input of another one.
###Software has to be tested early and thrown away when ineffective.
###Lighten programming tasks by using preferred tools and using detours to build the tools.
###The 'prime directive' of Linux: "Treat all users with respect"

#What is a VPS (virtual private server)?  What are the advantages of using a VPS?
##A VPS has its own operating system, disc storage space, and user allowed bandwidth attached to its physical server in a data center that is used for VPS hosting.
##The account holder holds the permissions for setting how the physical server will divide its spaces to become a virtual server.
##The account holder is in charge of the VPS and can reboot the server, shut it down, or use it like it is their own physical server.
##The VPS is a host for the account holder's program and acts as a place holder location for the program until the account holder decides to get their own physical server or not.
###Some benefits of a VPS: lower cost and less expensive to operate, run, maintain; good for those wary of the technological knowhow needed to host a server; often, you only pay for the features you need; plans can be scalable based on the account holder's needs; there is more control over a VPS than a shared hosting (have root access and can run scripts); share tech support.
###Examples of VPS programs are abundant, the example video used DataOcean!

#Root problems on Linux?
##Root privileges have absolute power over the account; they can be used to complete access to all files and commands, modify the system, grant and revoke permissions, etc...
##Linux assumes the system administrator knows what they're doing and that they will use the root account correctly.
##There is no safety net in the case of an error; hackers can find and exploit errors to gain control of the system.