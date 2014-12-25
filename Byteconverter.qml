import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Window {
    visible: true
    color: "lightgray"
    minimumHeight: 350
    maximumHeight: 350
    minimumWidth: 400
    maximumWidth: 400
    opacity: 0.5

    Column {
        spacing: 5

        // DECIMAL BLOCK
        Rectangle {
            height: 80
            width: 400
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
                
                TextField {
                    id: decimal
                    width: 280
                    font.pointSize: 30
                    focus: true
                    maximumLength: 4
                    text: "1"
                    validator: IntValidator{bottom: 0; top: 4095;}
                    onTextChanged: binary.text = ConvertToBase (this.text, 10, 2), 
                                   hexadecimal.text = ConvertToBase (this.text, 10, 16)
                                 
                }
            }                
        }

        //BINARY BLOCK
        Rectangle {
            height: 80
            width: 400
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
                height: 50
<<<<<<< HEAD
                    
            TextField {
                width: 280
                id: binary
=======
                color: "#ff00ffff"
                
            TextInput {
                id: binary
                color: "#BC6F1EFF"
>>>>>>> c118c97011f2bb2e3b8ca2bdea9bc8985440cf44
                font.pointSize: 30
                focus: true
                text: "1"
                validator: RegExpValidator {regExp: /[01]{1,10}/}
                onTextChanged: decimal.text = ConvertToBase (this.text, 2, 10), 
<<<<<<< HEAD
                               hexadecimal.text = ConvertToBase (this.text, 2, 16)
=======
                                    hexadecimal.text = ConvertToBase (this.text, 2, 16)
>>>>>>> c118c97011f2bb2e3b8ca2bdea9bc8985440cf44
                }
            }           
        }

        //HEXADECIMAL BLOCK
        Rectangle {
            height: 80
            width: 400

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
 
                TextField {
                    id: hexadecimal
                    width: 280
                    font.pointSize: 30
                    focus: true
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
