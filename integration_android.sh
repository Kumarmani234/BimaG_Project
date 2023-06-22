pushd android
		flutter build apk
		./gradlew app:assembleAndroidTest
		./gradlew app:assembleDebug -Ptarget=integration_test/bimag_home_module_test.dart	//PATH TO YOUR TEST.DART FILES
		popd