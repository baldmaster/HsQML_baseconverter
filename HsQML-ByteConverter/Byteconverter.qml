import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    color: "lightgray"
    width: 400
    height: 400

    Column {
        spacing: 5
        // DECIMAL BLOCK
        Rectangle {
            height: 80
            width: 400
            
            radius: 20

            Text {
                text: "Dec"
                font.pointSize: 30
                y: 15
                x: 15
            }

            Rectangle {
                id: dec
                x: 100
                y: 15
                width: 280
                height: 50
                color: "#ff00ffff"
                
                TextInput {
                    id: decimal
                    color: "#BC6F1EFF"
                    font.pointSize: 30
                    focus: true
                    maximumLength: 4
                    text: "1"
                    validator: IntValidator{bottom: 0; top: 1023;}
                    
                    onTextChanged: binary.text = ConvertToBase (this.text, 10, 2), 
                                   hexadecimal.text = ConvertToBase (this.text, 10, 16)
                }
            }                
        }

        //BINARY BLOCK
        Rectangle {
            height: 80
            width: 400
            
            radius: 20

            Text {
                text: "Bin"
                font.pointSize: 30
                y: 15
                x: 15
            }
            Rectangle {
                id: bin
                x: 100
                y: 15
                width: 280
                height: 50
                color: "#ff00ffff"
                
        TextInput {
                    id: binary
                    color: "#BC6F1EFF"
                    font.pointSize: 30
                    focus: true
                    text: "1"
                    validator: RegExpValidator {regExp: /[01]{1,10}/}
                    onTextChanged: decimal.text = ConvertToBase (this.text, 2, 10), 
                                   hexadecimal.text = ConvertToBase (this.text, 2, 16)
                }
            }           
        }

        //HEXADECIMAL BLOCK
        Rectangle {
            height: 80
            width: 400
            
            radius: 20

            Text {
                text: "Hex"
                font.pointSize: 30
                y: 15
                x: 15
            }

            Rectangle {
                id: hex   
                x: 100
                y: 15
                width: 280
                height: 50
                color: "#ff00ffff"
                
                TextInput {
                    id: hexadecimal
                    color: "#BC6F1EFF"
                    font.pointSize: 30
                    focus: true
                  //  maximumLength: 3
                    text: "1"
                    validator: RegExpValidator {regExp: /[0-9a-fA-F]{1,3}/}
                    onTextChanged: decimal.text = ConvertToBase (this.text, 16, 10), 
                                   binary.text = ConvertToBase (this.text, 16, 2)
                }
            }
        }
    }

    //EXIT BUTTON
    Button {
        y: 300
        text: "Quit"
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: Qt.quit()
        style: ButtonStyle {
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
            }
        }
    }
}
