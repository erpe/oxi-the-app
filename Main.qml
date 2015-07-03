import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "oxi.rene-so36"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(100)
    height: units.gu(75)
    pageStack: startPage

    PageStack {
      id: stack
      Component.onCompleted: push(startPage)

      Page {
        id: startPage
        title: "Greece - this sunday"
        visible: false


        Column {
          spacing: units.gu(1)

          anchors {
            margins: units.gu(2)
            fill: parent
          }

          Text {
              text: "So what should i do about the referendum \nin greece this sunday?"
              height: parent.height / 3
              color: UbuntuColors.darkGrey
          }

          Button {
            objectName: "button"
            width: parent.width
            text: "Compute the answer..."
            color: UbuntuColors.orange


            onClicked: {
              stack.push(answerPage)
            }
          }
        }
      }

      Page {
        id: answerPage
        title: "...its a begin"
        visible: false

        Column {
          spacing: units.gu(1)
          anchors {
            margins: units.gu(2)
            fill: parent
          }
          Label {
              text: "vote:"
          }

          Text {
            color: UbuntuColors.orange
            font.pointSize: 160;
            font.bold: true;
            text: "OXI";
            horizontalAlignment: Text.AlignHCenter;
            height: parent.height / 2
          }

          Label {
            id: aLabel
            text: "was'nt that easy?"
          }

          Text {
              text: '"Deutschland, du mieses Stück Scheisse!"'
              styleColor: UbuntuColors.orange
              color: UbuntuColors.orange
          }
        }
      }
    }
}

