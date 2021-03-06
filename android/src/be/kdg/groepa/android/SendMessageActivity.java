package be.kdg.groepa.android;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.*;
import be.kdg.groepa.android.task.SendMessageTask;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by Tim on 27/02/14.
 */
public class SendMessageActivity extends Activity implements AsyncResponse {

    private EditText editBodyText;
    private EditText editReceiverText;
    private EditText editSubjectText;


    @Override
    public void onCreate(Bundle savedInstanceState) {
        Bundle b = getIntent().getExtras();
        super.onCreate(savedInstanceState);
        setContentView(R.layout.sendmessage);
        editBodyText = (EditText) findViewById(R.id.editBodyText);
        editReceiverText = (EditText) findViewById(R.id.editReceiverText);
        editSubjectText = (EditText) findViewById(R.id.editSubjectText);
        Button btnSendMessage = (Button) this.findViewById(R.id.buttonSendMessage);
        SharedPreferences privPref = getApplicationContext().getSharedPreferences("CarpoolPreferences", MODE_PRIVATE);
        final String senderUsername = privPref.getString("Username", "");
        if (b != null) {
            if (b.containsKey("receiverUsername")) {
                editReceiverText.setText(b.getString("receiverUsername"));
                editReceiverText.setKeyListener(null);
            }
            if(b.containsKey("messageBody")){
                editBodyText.setText(b.getString("messageBody"));
                editBodyText.setKeyListener(null);
            }
            if(b.containsKey("messageSubject")){
                editSubjectText.setText(b.getString("messageSubject"));
                editSubjectText.setKeyListener(null);
            }
            if(b.containsKey("receiverUsername") && b.containsKey("messageBody") && b.containsKey("messageSubject")){
                SendMessageTask task = new SendMessageTask(senderUsername, editReceiverText.getText().toString(), editSubjectText.getText().toString(), editBodyText.getText().toString(), getApplicationContext(), this);
                task.execute();
            }
        }
        final AsyncResponse msgAc = this;
        btnSendMessage.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SendMessageTask task = new SendMessageTask(senderUsername, editReceiverText.getText().toString(), editSubjectText.getText().toString(), editBodyText.getText().toString(), getApplicationContext(), msgAc);
                task.execute();
            }
        });
    }

    @Override
    public void processFinish(String output) {
        JSONObject outputJson = null;
        Intent goToMyActivity = null;
        try {
            outputJson = new JSONObject(output);
        } catch (JSONException e) {
        }
        if (outputJson.has("result")) {
            try {
                Toast.makeText(getApplicationContext(), outputJson.getString("result"), Toast.LENGTH_LONG).show();
                goToMyActivity = new Intent(getApplicationContext(), HomePageActivity.class);
            } catch (JSONException e) {
            }
        } else if (outputJson.has("error")) {
            try {
                Toast.makeText(getApplicationContext(), outputJson.getString("error"), Toast.LENGTH_LONG).show();
                goToMyActivity = new Intent(getApplicationContext(), SendMessageActivity.class);
            } catch (JSONException e) {
            }
        }
        startActivity(goToMyActivity);
    }
}
