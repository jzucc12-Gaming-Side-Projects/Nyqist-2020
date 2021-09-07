//Luna main
converse_prop_0[0][0][0] = [BoxProp(),SpeakerProp(),"Howdy my man."];
converse_prop_0[0][0][1] = [BoxProp(),SpeakerProp(SPEAKER.luna,FACE.normal),"Hey..."];
converse_prop_0[0][0][2] = [BoxProp(0.5),SpeakerProp(),"What's up with you?"];
converse_prop_0[0][0][3] = [BoxProp(),SpeakerProp(SPEAKER.luna,FACE.normal),["Nothing Much.","Just walking.", "What's it to you?"]];
converse_prop_0[0][0][4] = [BoxProp(),SpeakerProp(),"Cool... I guess..."];
converse_prop_0[0][1][4] = [BoxProp(),SpeakerProp(),"I'm not."];
converse_prop_0[0][2][4] = [BoxProp(),SpeakerProp(),"Oh geez. Nevermind then."];

//Oscar main
converse_prop_0[1][0][0] = converse_prop_0[0][0][0];
converse_prop_0[1][0][1] = [BoxProp(),SpeakerProp(SPEAKER.oscar,FACE.normal),"Sup dude?"];
converse_prop_0[1][0][2] = [BoxProp(0.5),SpeakerProp(),"Nothin' much. How about you?"];
converse_prop_0[1][0][3] = [BoxProp(),SpeakerProp(SPEAKER.oscar,FACE.normal),["Swell.","Okay", "Not too great really."]];
converse_prop_0[1][0][4] = [BoxProp(),SpeakerProp(),"Good!"];
converse_prop_0[1][1][4] = [BoxProp(),SpeakerProp(),"Well, that's fine!"];
converse_prop_0[1][2][4] = [BoxProp(),SpeakerProp(),"Oh well."];
converse_options[0] = converse_prop_0;