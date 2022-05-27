/*
 *   Copyright 2022 SignKirigami <prcups@v-signal.xyz>
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

import QtQuick 2.1
import QtQuick.Controls 2.15


Image {
    id: root
    source: "images/background.png"

    property int stage

    onStageChanged: {
        if (stage == 5) {
            introAnimation.running = true
        }
    }
    Image {
        id: lm
        source: "images/lm.png"
        anchors.centerIn: parent
        opacity: 0
    }
    Image {
        id: lwlk
        source: "images/lwlk.png"
        x: parent.width - parent.width / 3 * (stage - 1)
        y: parent.height - parent.height / 3 * (stage - 1)
        Behavior on x {
            PropertyAnimation {
                duration: 250
                easing.type: Easing.InOutQuad
            }
        }
        Behavior on y {
            PropertyAnimation {
                duration: 250
                easing.type: Easing.InOutQuad
            }
        }
    }

    SequentialAnimation {
        id: introAnimation
        running: false
        ParallelAnimation {
            PropertyAnimation {
                property: "opacity"
                target: lm
                from: 0
                to: 1
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }
        }
    }
}
