package mdsadabwasim.plugin_demo;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import com.shashank.sony.fancytoastlib.FancyToast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import es.dmoral.toasty.Toasty;

/**
 * Plugin demo
 */
public class PluginDemoPlugin implements MethodCallHandler {

    private Context mContext;
    private Toast mToast;

    private PluginDemoPlugin(Context context) {
        mContext = context;

    }

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "plugin_demo");
        channel.setMethodCallHandler(new PluginDemoPlugin(registrar.context()));
    }

    @Override
    public void onMethodCall(MethodCall call, final Result result) {
        switch (call.method) {
            case "showToast":
                String mMessage = call.argument("msg").toString();
                String length = call.argument("length");
                String type = call.argument("type");

                int toastLength = 5;
                if (length == "Toast.LENGTH_LONG") {
                    toastLength = 10;
                }
            
                int toastType = 5;
                if (type == "ToastType.INFO") {
                    toastType = 4;
                } else if (type == "ToastType.WARNING") {
                    toastType = 2;
                } else if (type == "ToastType.ERROR") {
                    toastType = 3;
                } else if (type == "ToastType.CONFUSING") {
                    toastType = 6;
                }  else if (type == "ToastType.SUCCESS") {
                    toastType = 1;
                }else {
                    toastType = 5;
                }

              
              FancyToast.makeText(mContext,mMessage,toastLength,toastType,true).show();
               result.success(true);
                break;
            case "cancel":
                if (mToast != null) {
                    mToast.cancel();
                }
                result.success(true);
                break;
            case "dialog":
            Toasty.success(mContext, "Success!", Toast.LENGTH_SHORT, true).show();
            result.success(true);
              break;
              case "infoDialog":
              Toasty.info(mContext, "Here is some info for you.", Toast.LENGTH_SHORT, true).show();
            result.success(true);
              break;
              case "warningDialog":
              Toasty.warning(mContext, "Beware of the dog.", Toast.LENGTH_SHORT, true).show();
            result.success(true);
              break;
              case "errorDialog":
              Toasty.error(mContext, "This is an error toast.", Toast.LENGTH_SHORT, true).show();
            result.success(true);
              break;
            default:
                result.notImplemented();
                break;
        }
    }

    private float dp2px(float dp) {
        final float scale = mContext.getResources().getDisplayMetrics().density;
        return dp * scale + 0.5f;
    }
}