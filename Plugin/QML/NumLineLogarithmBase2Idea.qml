import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.15

import com.malamute.calculator 1.0
//import "LogarithmHelperFunctions.js" as HelperFunctions

Item
{
    id: root
    width: 544
    height: 234
    property double savedInput: 0.0

    Connections
    {
        target: idea
        function onDisplay(input, output)
        {
            verticalLinesArea.clear();
            idea.setUpLimit(Math.ceil(input));
            root.savedInput = input;
            numInputText.text = input;
            initialDot.x = numLine.x + numLine.width * input / idea.upLimit - initialDot.width / 2;
            numOutRect.outNum = 0.0;
            movingDot.value = input;

            verticalLinesArea.addLine(numLine.width * movingDot.value / idea.upLimit);
        }
    }

    Rectangle
    {
        id: numLineArea
        width: parent.width
        height: 120
        radius: 8
        color: "#050512"
        border.width: 4
        border.color: "black"

        readonly property double fontSize: 18
        readonly property color numLineColor: "#a6b0cb"

        Rectangle
        {
            id: numLine
            height: 2
            width: parent.width - 40
            x: 20
            y: 80
            color: numLineArea.numLineColor
        }

        Item
        {
            id: verticalLinesArea
            width: numLine.width
            x: numLine.x
            y: numLine.y - 30
            height: 20
            visible: idea.valid

            function clear()
            {
                for(let i = 0; i < verticalLinesArea.children.length; i++)
                    verticalLinesArea.children[i].destroy();
            }
            function addLine(x)
            {
                let comp = Qt.createComponent("NumLineLogVertLine.qml")
                let obj = comp.createObject(verticalLinesArea,{x: x - 0.25, color: idea.inPortLabelColors[0]});
            }
        }

        Rectangle
        {
            id: initialDot
            color: idea.inPortLabelColors[0]
            opacity: 0.3
            width: 10
            height: width
            radius: width / 2
            y: 40
            x: 150
            visible: idea.valid
        }

        Rectangle
        {
            id: movingDot

            property double value : 0.0;

            color: idea.inPortLabelColors[0]
            width: 10
            height: width
            radius: width / 2
            y: 40
            x: numLine.x + numLine.width * value / idea.upLimit - movingDot.width / 2
            visible: idea.valid

            Behavior on x{NumberAnimation{duration: 300; easing.type: Easing.InOutQuad}}

            Rectangle
            {
                id: downwardBar
                color: parent.color
                anchors.horizontalCenter: parent.horizontalCenter
                y: -2
                width: 2
                height: 32
            }

            Text
            {
                id: movingDotLabel
                text: movingDot.value.toFixed(5);
                anchors.horizontalCenter: movingDot.horizontalCenter
                y: -30
                font.pointSize: 16
                color: movingDot.color

            }
            Rectangle
            {
                id: movingDotLabelBackground
                z: movingDotLabel.z - 1;
                anchors.centerIn: movingDotLabel
                color: "#050512"
                border.color: movingDot.color
                border.width: 1
                radius: 4
                width: movingDotLabel.width + 8
                height: movingDotLabel.height + 8;
            }

            function divideBy2()
            {
                if(value >= 2.0)
                {
                    verticalLinesArea.addLine(numLine.width * movingDot.value / idea.upLimit);
                    popSound.play();
                    value /= 2;
                    numOutRect.outNum += 1;
                    add1.animate();
                }
            }
            function divideby1_07177()
            {
                if(value >= 1.07177)
                {
                    verticalLinesArea.addLine(numLine.width * movingDot.value / idea.upLimit);
                    popSound.play();
                    value /= 1.071773463;
                    numOutRect.outNum += 0.1;
                    add2.animate();
                }
            }
            function divideby1_00695()
            {
                if(value >= 1.00695)
                {
                    verticalLinesArea.addLine(numLine.width * movingDot.value / idea.upLimit);
                    popSound.play();
                    value /= 1.00695555;
                    numOutRect.outNum += 0.01;
                    add3.animate();
                }
            }
            function divideby1_00069()
            {
                if(value >= 1.00069)
                {
                    verticalLinesArea.addLine(numLine.width * movingDot.value / idea.upLimit);
                    popSound.play();
                    value /= 1.000693387;
                    numOutRect.outNum += 0.001;
                    add4.animate();
                }
            }
        }

        Rectangle
        {
            id: vertLineZero
            color: numLineArea.numLineColor
            x: numLine.x - width / 2
            width: 2
            height: 10
            y: numLine.y + numLine.height / 2 - height / 2
        }
        Text
        {
            id: zeroText
            text: "0"
            font.pointSize: numLineArea.fontSize
            color: numLineArea.numLineColor
            x: vertLineZero.x + vertLineZero.width / 2 - width / 2
            y: vertLineZero.y + vertLineZero.height - 2
            visible: idea.upLimit < 40;
        }
        Rectangle
        {
            id: vertLineOne
            color: numLineArea.numLineColor
            x: numLine.x - width / 2 + numLine.width / idea.upLimit
            width: 2
            height: 10
            y: numLine.y + numLine.height / 2 - height / 2
        }
        Text
        {
            id: oneText
            text: "1"
            font.pointSize: numLineArea.fontSize
            color: numLineArea.numLineColor
            x: vertLineOne.x + vertLineOne.width / 2 - width / 2
            y: vertLineOne.y + vertLineOne.height - 2
        }
        Rectangle
        {
            id: nLineZero
            color: numLineArea.numLineColor
            x: numLine.x + numLine.width - width / 2
            width: 2
            height: 10
            y: numLine.y + numLine.height / 2 - height / 2
        }
        Text
        {
            id: nText
            text: idea.upLimit
            visible: idea.valid
            font.pointSize: numLineArea.fontSize
            color: numLineArea.numLineColor
            x: nLineZero.x + nLineZero.width / 2 - width / 2
            y: nLineZero.y + nLineZero.height + 2
        }
    }

    Rectangle
    {
        id: numInputRect
        color: "#1a1a1a"
        border.width: 4
        border.color: "#333333"
        width: 100
        height: 64
        radius: 8
        y: numLineArea.height + (root.height - numLineArea.height) / 2 - height / 2 - 10;
        visible: idea.valid;

        Text
        {
            id: numInputText
            anchors.centerIn: parent
            color: idea.inPortLabelColors[0]
            font.pointSize: 20
            text: "64.32"
        }
    }

    Rectangle
    {
        id: controlsRow
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -15
        y: numLineArea.height - 4
        z: 1
        width: 304
        height: 120
        radius: 8
        color: "#050512"

        Button
        {
            id: divideButton1
            text: "Divide by 2.00000"
            x: 4
            height: 36
            width: divideButton4.width
            font.capitalization: Font.MixedCase
            font.family: "verdana"
            font.bold: true;
            font.pointSize: 14
            Material.background: idea.inPortLabelColors[0]
            Material.foreground: "black"

            onClicked: {movingDot.divideBy2();}
        }
        Button
        {
            id: divideButton2
            text: "Divide by 1.07177"
            x: 4
            y: divideButton1.y + divideButton1.height - 8;
            height: 36
            width: divideButton4.width
            font.capitalization: Font.MixedCase
            font.family: "verdana"
            font.bold: true;
            font.pointSize: 14
            Material.background: Qt.darker(idea.inPortLabelColors[0], 1.15)
            Material.foreground: "black"
            onClicked:
            {
                movingDot.divideby1_07177()
            }
        }
        Button
        {
            id: divideButton3
            text: "Divide by 1.00695"
            x: 4
            y: divideButton2.y + divideButton2.height - 8;
            height: 36
            width: divideButton4.width
            font.capitalization: Font.MixedCase
            font.family: "verdana"
            font.bold: true;
            font.pointSize: 14
            Material.background: Qt.darker(idea.inPortLabelColors[0], 1.3)
            Material.foreground: "black"
            onClicked:
            {
                movingDot.divideby1_00695()
            }
        }
        Button
        {
            id: divideButton4
            text: "Divide by 1.00069"
            x: 4
            y: divideButton3.y + divideButton3.height - 8;
            height: 36
            font.capitalization: Font.MixedCase
            font.family: "verdana"
            font.bold: true;
            font.pointSize: 14
            Material.background: Qt.darker(idea.inPortLabelColors[0], 1.45)
            Material.foreground: "black"
            onClicked:
            {
                movingDot.divideby1_00069();
            }
        }

        Rectangle
        {
            id: add1
            color: idea.outPortLabelColors[0]
            width: 80
            height: 22
            radius: 4
            anchors.right: parent.right
            anchors.rightMargin: 4
            anchors.verticalCenter: divideButton1.verticalCenter
            Text
            {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 4
                text: "+1.000";
                color: "black"
                font.bold: true;
                font.pointSize: 14
            }
            function animate() {animation.start();}
            SequentialAnimation
            {
                id: animation
                NumberAnimation{target: add1; property: "anchors.rightMargin"; to: -50; duration: 200; easing.type: Easing.InOutQuad;}
                NumberAnimation{target: add1; property: "anchors.rightMargin"; to: 4; duration: 200; easing.type: Easing.InOutQuad;}
            }
        }
        Rectangle
        {
            id: add2
            color: Qt.darker(idea.outPortLabelColors[0], 1.15)
            width: 80
            height: 22
            radius: 4
            anchors.right: parent.right
            anchors.rightMargin: 4
            anchors.verticalCenter: divideButton2.verticalCenter
            Text
            {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 4
                text: "+0.100";
                color: "black"
                font.bold: true;
                font.pointSize: 14
            }
            function animate() {animation2.start();}
            SequentialAnimation
            {
                id: animation2
                NumberAnimation{target: add2; property: "anchors.rightMargin"; to: -50; duration: 200; easing.type: Easing.InOutQuad;}
                NumberAnimation{target: add2; property: "anchors.rightMargin"; to: 4; duration: 200; easing.type: Easing.InOutQuad;}
            }
        }
        Rectangle
        {
            id: add3
            color: Qt.darker(idea.outPortLabelColors[0], 1.3)
            width: 80
            height: 22
            radius: 4
            anchors.right: parent.right
            anchors.rightMargin: 4
            anchors.verticalCenter: divideButton3.verticalCenter
            Text
            {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 4
                text: "+0.010";
                color: "black"
                font.bold: true;
                font.pointSize: 14
            }
            function animate() {animation3.start();}
            SequentialAnimation
            {
                id: animation3
                NumberAnimation{target: add3; property: "anchors.rightMargin"; to: -50; duration: 200; easing.type: Easing.InOutQuad;}
                NumberAnimation{target: add3; property: "anchors.rightMargin"; to: 4; duration: 200; easing.type: Easing.InOutQuad;}
            }
        }
        Rectangle
        {
            id: add4
            color: Qt.darker(idea.outPortLabelColors[0], 1.45)
            width: 80
            height: 22
            radius: 4
            anchors.right: parent.right
            anchors.rightMargin: 4
            anchors.verticalCenter: divideButton4.verticalCenter
            Text
            {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 4
                text: "+0.001";
                color: "black"
                font.bold: true;
                font.pointSize: 14
            }
            function animate() {animation4.start();}
            SequentialAnimation
            {
                id: animation4
                NumberAnimation{target: add4; property: "anchors.rightMargin"; to: -50; duration: 200; easing.type: Easing.InOutQuad;}
                NumberAnimation{target: add4; property: "anchors.rightMargin"; to: 4; duration: 200; easing.type: Easing.InOutQuad;}
            }
        }
    }

    Rectangle
    {
        property double outNum: 0;
        id: numOutRect
        color: "#1a1a1a"
        border.width: 4
        border.color: "#333333"
        width: 100
        height: 64
        radius: 8
        anchors.right: parent.right
        y: numLineArea.height + (root.height - numLineArea.height) / 2 - height / 2 - 10;
        visible: idea.valid;
        onOutNumChanged: {numOutText.text = outNum.toFixed(3);}

        Text
        {
            id: numOutText
            anchors.centerIn: parent
            color: idea.outPortLabelColors[0]
            font.pointSize: 20
            text: "0.0"
        }
    }

    Button
    {
        id: resetButton
        height: 36
        text: "Reset"
        enabled: idea.valid;
        anchors.horizontalCenter: numOutRect.horizontalCenter
        anchors.bottom: parent.bottom
        onClicked:
        {
            numOutRect.outNum = 0.0;
            movingDot.value = root.savedInput;
            verticalLinesArea.clear();
        }
        font.capitalization: Font.MixedCase
        font.family: "verdana"
        font.bold: true;
        font.pointSize: 16
        Material.background: Material.Grey
        Material.foreground:  "black"
    }

    SoundEffect
    {
        id: popSound
        source: "qrc:/SoundEffects/shortPop.wav"
        volume: 0.3
    }
}
