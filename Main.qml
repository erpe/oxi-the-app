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
          Button {
              objectName: "button"
              width: parent.width
              text: "see Results"
              color: UbuntuColors.green
              onClicked: {
                  stack.push(resultPage)
                  //stack.push(result)
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
            height: parent.height / 3
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
      Page {
          id: resultPage
          title: "OXI"
          visible: false
          Column {
              id: row1
              height: txt.height
              spacing: units.gu(1)
              anchors {
                  margins: units.gu(2)
                  fill: parent
              }

              Text {
                color: UbuntuColors.orange
                font.pointSize: 80;
                font.bold: true;
                text: "61,3%";
                horizontalAlignment: Text.AlignHCenter;
                //height: parent.height / 4
              }

              Text {
                  id: txt
                  color: UbuntuColors.darkAubergine
                  text: "The OXI will remain. \nIt must and will be generalized - \nin the rest of Europe and beyond.\n And the semantics of the NO is \n the state of the struggle: \nThe new is not yet known.\nBut the fear is vanquished.\nAs it is, it must not remain."
                  horizontalAlignment: Text.AlignHCenter;
              }

              Image { id: image; fillMode: Image.TileHorizontally; source: "nelke.png" }
          }
       }
    }
}

