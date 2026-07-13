/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.5
import Qt5Compat.GraphicalEffects

Rectangle {
    id: root
    color: "#151617"
    anchors.fill: parent
    property int stage

    property variant images : [
        "images/leaf-loading1.png",
        "images/leaf-loading2.png",
        "images/leaf-loading3.png",
        "images/leaf-loading4.png",
        "images/leaf-loading5.png",
        "images/leaf-loading6.png",
        "images/leaf-loading7.png",
        "images/leaf-loading8.png",
        "images/leaf-loading9.png",
    ];
    property int currentImage : 0;

    Repeater {
        id: repeaterImg;
        model: images;
        delegate: Image {
            id: spinner
            source: modelData;
            asynchronous: true;
            height: ;
            width: ;
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            visible: (model.index === currentImage);

            OpacityAnimator {
                target: spinner;
                from: 0;
                to: 1;
                duration: 100;
                running: true
            }
        }
    }

    Timer {
        id: timerAnimImg;
        interval: 125; // here is the delay between 2 images in msecs
        running: true; // stopped by default, use start() or running=true to launch
        repeat: true;
        onTriggered: {
            if (currentImage < images.length -1) {
                currentImage++; // show next image
            }
            else {
                currentImage = 0; // go back to the first image at the end
            }
        }
    }
}
