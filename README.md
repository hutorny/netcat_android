# netcat_android
Build scripts for building netcat with Android NDK

Building:
---------

To build netcat for Android do the following:

 1. Download the latest NDK from:
    http://developer.android.com/tools/sdk/ndk/index.html

 2. Extract the NDK.
 
 3. Clone this project from repository
 
	git clone https://github.com/hutorny/netcat_android.git

 4. Change directory to netcat_android/jni

	cd netcat_android/jni

 3. Open a shell and make sure there exist an NDK global variable
    set to the directory where you extracted the NDK.

	export NDK=<path to NDK>

 5. Run "$NDK/ndk-build".

Upon success, the `netcat` executable will placed in
`netcat_android/libs/<abi>/`

Adding to existing project:
---------------------------

 1. Copy `autogen.sh netcat_download.mk netcat.mk` to your jni folder
 2. Add `include $(LOCAL_PATH)/netcat.mk` to your Android.mk file
 