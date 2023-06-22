package com.bimag.app

import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.IntentSender
import android.telephony.TelephonyManager
import android.view.View
import android.widget.Toast
import com.google.android.gms.auth.api.Auth
import com.google.android.gms.auth.api.credentials.Credential
import com.google.android.gms.auth.api.credentials.HintRequest
import com.google.android.gms.common.api.GoogleApiClient
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "com.bimag.payg/sim_verification"
    private val PHONE_NUMBER_REQUEST = 111
    private var pendingHintResult: Result? = null

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == PHONE_NUMBER_REQUEST) {
            if (resultCode == RESULT_OK) { // Activity.RESULT_OK
                val credential: Credential?;
                credential = data?.getParcelableExtra(Credential.EXTRA_KEY)
                pendingHintResult?.success(credential?.id.toString())
                //Toast.makeText(this, credential?.id.toString(), Toast.LENGTH_SHORT).show()
            }
        }
    }

   /* override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent) {
        super.onActivityResult(requestCode, resultCode, data)

        // check that it is the SecondActivity with an OK result
        if (requestCode == PHONE_NUMBER_REQUEST) {
            if (resultCode == RESULT_OK) { // Activity.RESULT_OK
                val credential: Credential?;
                credential = data.getParcelableExtra(Credential.EXTRA_KEY)
                pendingHintResult?.success(credential?.id.toString())
                //Toast.makeText(this, credential?.id.toString(), Toast.LENGTH_SHORT).show()
            }
        }
    }*/

    override fun getBackgroundMode(): FlutterActivityLaunchConfigs.BackgroundMode {
        return FlutterActivityLaunchConfigs.BackgroundMode.transparent
    }

    override fun configureFlutterEngine( flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            // This method is invoked on the main thread.
            // TODO
            pendingHintResult = result;
            if(call.method == "getSimNumber"){
                fetchSimNumber()
            }
        }
    }

    private fun fetchSimNumber() {
       // Toast.makeText(this, "Its a toast!", Toast.LENGTH_SHORT).show()
        if (!isSimSupport()) {
            if (pendingHintResult != null) {
                pendingHintResult!!.success(null);
            }
            return;
        }

        val hintRequest: HintRequest =
            com.google.android.gms.auth.api.credentials.HintRequest.Builder()
                .setPhoneNumberIdentifierSupported(true)
                .build()
        val mCredentialsClient: GoogleApiClient =
            com.google.android.gms.common.api.GoogleApiClient.Builder(this)
                .addApi(Auth.CREDENTIALS_API)
                .build()

       // Toast.makeText(this, mCredentialsClient.blockingConnect().resolution.creatorUid.toString(), Toast.LENGTH_SHORT).show()

        val intent: PendingIntent = Auth.CredentialsApi.getHintPickerIntent(
            mCredentialsClient, hintRequest
        )
        try {
            startIntentSenderForResult(
                intent.getIntentSender(),
                PHONE_NUMBER_REQUEST, null, 0, 0, 0
            )
        } catch (e: IntentSender.SendIntentException) {
            e.printStackTrace()
        }
    }

    fun isSimSupport(): Boolean {
        val telephonyManager: TelephonyManager =
            getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager
        return !(telephonyManager.getSimState() === TelephonyManager.SIM_STATE_ABSENT)
    }
}
