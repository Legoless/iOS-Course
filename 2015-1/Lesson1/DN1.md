### Why do we use the next frameworks?

- CloudKit - working with iCloud database, which can serve as a fully functional backend of an application.
- CoreTelephony - provides information about user's cellular service provider.
- HomeKit - provides integration with home accessories and automation devices.
- PassKit - To work with passes in Wallet, including In App Purchases and Apple Pay.

https://developer.apple.com/library/prerelease/ios/documentation/

### What's the difference between simulator and emulator?

A simulator is an application that simulates a system that behaves similar to the real device, but is implemented in an entirely different way. It provides the basic behaviour of a system, but may not necessarily adhere to all of the rules of the system being simulated.

An emulator is an application that emulates a system that behaves exactly like something else, and adheres to all of the rules of the system being emulated. It is effectively a complete replication of another system, right down to being binary compatible with the emulated system's inputs and outputs, but operating in a different environment to the environment of the original emulated system. The rules are fixed, and cannot be changed, or the system fails.

http://programmers.stackexchange.com/questions/134746/whats-the-difference-between-simulation-and-emulation

### Why do we implement animations in our apps?

- To communicate status and provide feedback
- Enhance the sense of direct manipulation
- Help people visualize the results of their actions

https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/Animation.html#//apple_ref/doc/uid/TP40006556-CH57-SW1