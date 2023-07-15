# Notification 💻
### Swift MacOS

Before running, you'll need allow the notification. For that:
<ul>
  <li>Click on the Apple icon on the left top of screen > System Settings > Notifications</li>
  <li>Scroll to the file of your Xcode project</li>
  <li>Allow notifications</li>
</ul>

Now, to make the app request the notification you'll need to use the following lines:

```
un.requestAuthorization(options: [.alert, .sound]) { authorized, error in
                    if authorized {
                        print("Authorized")
                    } else if !authorized {
                        print("Not authorized")
                    } else {
                        print(error?.localizedDescription as Any)
                    }
                }
```

Notification            |  
:-------------------------:|
<img src="https://media.discordapp.net/attachments/1113871889497083968/1129743985754263562/Captura_de_Tela_2023-07-15_as_08.25.14.png?width=1372&height=294" alt="Notification" width="685" height="150"> |

Options            |  
:-------------------------:|
<img src="https://media.discordapp.net/attachments/1113871889497083968/1129743986081411132/Captura_de_Tela_2023-07-15_as_08.25.26.png?width=1420&height=674" alt="Options" width="730" height="346"> |

Details            |  
:-------------------------:|
<img src="https://media.discordapp.net/attachments/1113871889497083968/1129743986635046932/Captura_de_Tela_2023-07-15_as_08.25.39.png?width=596&height=938" alt="Details" width="300" height="472"> |
