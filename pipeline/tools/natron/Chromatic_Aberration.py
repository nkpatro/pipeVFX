# -*- coding: utf-8 -*-
# DO NOT EDIT THIS FILE
# This file was automatically generated by Natron PyPlug exporter version 10.

# Hand-written code should be added in a separate file named Chromatic_AberrationExt.py
# See http://natron.readthedocs.org/en/master/groups.html#adding-hand-written-code-callbacks-etc
# Note that Viewers are never exported

import NatronEngine
import sys

# Try to import the extensions file where callbacks and hand-written code should be located.
try:
    from Chromatic_AberrationExt import *
except ImportError:
    pass

def getPluginID():
    return "Comunity_plug.chromatic_aberration"

def getLabel():
    return "Chromatic_Aberration"

def getVersion():
    return 3

def getIconPath():
    return "Chromatic_Aberration.png"

def getGrouping():
    return "Filter"

def getPluginDescription():
    return "This PyPlug create a chromatic aberration effect, similar to the one found in Blender."

def createInstance(app,group):
    # Create all nodes in the group

    # Create the parameters of the group node the same way we did for all internal nodes
    lastNode = group

    # Create the user parameters
    lastNode.userNatron = lastNode.createPageParam("userNatron", "User")
    lastNode.Controls = lastNode.createPageParam("Controls", "Controls")
    param = lastNode.createDoubleParam("disp", "Dispertion")
    param.setMinimum(-10, 0)
    param.setMaximum(10, 0)
    param.setDisplayMinimum(0, 0)
    param.setDisplayMaximum(1, 0)

    # Add the param to the page
    lastNode.Controls.addParam(param)

    # Set param properties
    param.setHelp("Strength of the chromatic aberration effect")
    param.setAddNewLine(True)
    param.setAnimationEnabled(True)
    param.setValue(0.2, 0)
    lastNode.disp = param
    del param

    param = lastNode.createDoubleParam("sample", "Sampling")
    param.setMinimum(0, 0)
    param.setMaximum(5, 0)
    param.setDisplayMinimum(0, 0)
    param.setDisplayMaximum(1, 0)

    # Add the param to the page
    lastNode.Controls.addParam(param)

    # Set param properties
    param.setHelp("Sampling of the effect, increase value to get rid of the noise at cost of time calculation")
    param.setAddNewLine(True)
    param.setAnimationEnabled(True)
    param.setValue(0.0001, 0)
    lastNode.sample = param
    del param

    param = lastNode.createBooleanParam("use_border", "Border Accentuation")

    # Add the param to the page
    lastNode.Controls.addParam(param)

    # Set param properties
    param.setHelp("This enable the border accentuation, and take a little longer to compute")
    param.setAddNewLine(True)
    param.setAnimationEnabled(True)
    lastNode.use_border = param
    del param

    param = lastNode.createDoubleParam("border", "Accentuate Borders")
    param.setMinimum(0, 0)
    param.setMaximum(20, 0)
    param.setDisplayMinimum(0, 0)
    param.setDisplayMaximum(1, 0)

    # Add the param to the page
    lastNode.Controls.addParam(param)

    # Set param properties
    param.setHelp("This parameter blurs more on the borders.\nBy setting a lower Dispertion value and increasing this parameter , you can have the center of the image more cleaner.")
    param.setAddNewLine(True)
    param.setAnimationEnabled(True)
    param.setValue(0.2, 0)
    lastNode.border = param
    del param

    # Refresh the GUI with the newly created parameters
    lastNode.setPagesOrder(['userNatron', 'Controls', 'Node', 'Settings', 'Info'])
    lastNode.refreshUserParamsGUI()
    del lastNode

    # Start of node "Output1"
    lastNode = app.createNode("fr.inria.built-in.Output", 1, group)
    lastNode.setScriptName("Output1")
    lastNode.setLabel("Output1")
    lastNode.setPosition(1255, 1236)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.7, 0.7, 0.7)
    groupOutput1 = lastNode

    del lastNode
    # End of node "Output1"

    # Start of node "Input1"
    lastNode = app.createNode("fr.inria.built-in.Input", 1, group)
    lastNode.setScriptName("Input1")
    lastNode.setLabel("Input1")
    lastNode.setPosition(1087, -324)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.3, 0.5, 0.2)
    groupInput1 = lastNode

    del lastNode
    # End of node "Input1"

    # Start of node "Shuffle1"
    lastNode = app.createNode("net.sf.openfx.ShufflePlugin", 2, group)
    lastNode.setScriptName("Shuffle1")
    lastNode.setLabel("R-in")
    lastNode.setPosition(146, 142)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.6, 0.24, 0.39)
    groupShuffle1 = lastNode

    param = lastNode.getParam("outputChannelsChoice")
    if param is not None:
        param.setValue("Color.RGBA")
        del param

    param = lastNode.getParam("outputRChoice")
    if param is not None:
        param.setValue("A.r")
        del param

    param = lastNode.getParam("outputG")
    if param is not None:
        param.set("A.r")
        del param

    param = lastNode.getParam("outputGChoice")
    if param is not None:
        param.setValue("A.r")
        del param

    param = lastNode.getParam("outputB")
    if param is not None:
        param.set("A.r")
        del param

    param = lastNode.getParam("outputBChoice")
    if param is not None:
        param.setValue("A.r")
        del param

    param = lastNode.getParam("outputAChoice")
    if param is not None:
        param.setValue("A.a")
        del param

    del lastNode
    # End of node "Shuffle1"

    # Start of node "Dot2"
    lastNode = app.createNode("fr.inria.built-in.Dot", 1, group)
    lastNode.setScriptName("Dot2")
    lastNode.setLabel("Dot2")
    lastNode.setPosition(403, 158)
    lastNode.setSize(15, 15)
    lastNode.setColor(0.7, 0.7, 0.7)
    groupDot2 = lastNode

    del lastNode
    # End of node "Dot2"

    # Start of node "Shuffle1_1"
    lastNode = app.createNode("net.sf.openfx.ShufflePlugin", 2, group)
    lastNode.setScriptName("Shuffle1_1")
    lastNode.setLabel("G-in")
    lastNode.setPosition(358, 229)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.6, 0.24, 0.39)
    groupShuffle1_1 = lastNode

    param = lastNode.getParam("outputChannelsChoice")
    if param is not None:
        param.setValue("Color.RGBA")
        del param

    param = lastNode.getParam("outputR")
    if param is not None:
        param.set("A.g")
        del param

    param = lastNode.getParam("outputRChoice")
    if param is not None:
        param.setValue("A.g")
        del param

    param = lastNode.getParam("outputGChoice")
    if param is not None:
        param.setValue("A.g")
        del param

    param = lastNode.getParam("outputB")
    if param is not None:
        param.set("A.g")
        del param

    param = lastNode.getParam("outputBChoice")
    if param is not None:
        param.setValue("A.g")
        del param

    param = lastNode.getParam("outputAChoice")
    if param is not None:
        param.setValue("A.a")
        del param

    del lastNode
    # End of node "Shuffle1_1"

    # Start of node "Shuffle1_1_1"
    lastNode = app.createNode("net.sf.openfx.ShufflePlugin", 2, group)
    lastNode.setScriptName("Shuffle1_1_1")
    lastNode.setLabel("B-in")
    lastNode.setPosition(885, 144)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.6, 0.24, 0.39)
    groupShuffle1_1_1 = lastNode

    param = lastNode.getParam("outputChannelsChoice")
    if param is not None:
        param.setValue("Color.RGBA")
        del param

    param = lastNode.getParam("outputR")
    if param is not None:
        param.set("A.b")
        del param

    param = lastNode.getParam("outputRChoice")
    if param is not None:
        param.setValue("A.b")
        del param

    param = lastNode.getParam("outputG")
    if param is not None:
        param.set("A.b")
        del param

    param = lastNode.getParam("outputGChoice")
    if param is not None:
        param.setValue("A.b")
        del param

    param = lastNode.getParam("outputBChoice")
    if param is not None:
        param.setValue("A.b")
        del param

    param = lastNode.getParam("outputAChoice")
    if param is not None:
        param.setValue("A.a")
        del param

    del lastNode
    # End of node "Shuffle1_1_1"

    # Start of node "DirBlur1"
    lastNode = app.createNode("net.sf.openfx.DirBlur", 1, group)
    lastNode.setScriptName("DirBlur1")
    lastNode.setLabel("Blur_R")
    lastNode.setPosition(144, 473)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.8, 0.5, 0.3)
    groupDirBlur1 = lastNode

    param = lastNode.getParam("scale")
    if param is not None:
        param.setValue(0.98, 0)
        param.setValue(1.02, 1)
        del param

    param = lastNode.getParam("uniform")
    if param is not None:
        param.setValue(True)
        del param

    param = lastNode.getParam("filter")
    if param is not None:
        param.set("Impulse")
        del param

    param = lastNode.getParam("motionBlur")
    if param is not None:
        param.setValue(0.1, 0)
        del param

    del lastNode
    # End of node "DirBlur1"

    # Start of node "DirBlur1_1"
    lastNode = app.createNode("net.sf.openfx.DirBlur", 1, group)
    lastNode.setScriptName("DirBlur1_1")
    lastNode.setLabel("Blur_B")
    lastNode.setPosition(886, 354)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.8, 0.5, 0.3)
    groupDirBlur1_1 = lastNode

    param = lastNode.getParam("scale")
    if param is not None:
        param.setValue(1.02, 0)
        param.setValue(0.95, 1)
        del param

    param = lastNode.getParam("uniform")
    if param is not None:
        param.setValue(True)
        del param

    param = lastNode.getParam("filter")
    if param is not None:
        param.set("Impulse")
        del param

    param = lastNode.getParam("motionBlur")
    if param is not None:
        param.setValue(0.1, 0)
        del param

    del lastNode
    # End of node "DirBlur1_1"

    # Start of node "Merge3"
    lastNode = app.createNode("net.sf.openfx.MergePlugin", 1, group)
    lastNode.setScriptName("Merge3")
    lastNode.setLabel("Merge3")
    lastNode.setPosition(1253, 644)
    lastNode.setSize(104, 66)
    lastNode.setColor(0.3, 0.37, 0.776)
    groupMerge3 = lastNode

    param = lastNode.getParam("NatronOfxParamStringSublabelName")
    if param is not None:
        param.setValue("copy")
        del param

    param = lastNode.getParam("operation")
    if param is not None:
        param.set("copy")
        del param

    param = lastNode.getParam("bbox")
    if param is not None:
        param.set("B")
        del param

    param = lastNode.getParam("maskInvert")
    if param is not None:
        param.setValue(True)
        del param

    del lastNode
    # End of node "Merge3"

    # Start of node "Dot5"
    lastNode = app.createNode("fr.inria.built-in.Dot", 1, group)
    lastNode.setScriptName("Dot5")
    lastNode.setLabel("Dot5")
    lastNode.setPosition(1300, -205)
    lastNode.setSize(15, 15)
    lastNode.setColor(0.7, 0.7, 0.7)
    groupDot5 = lastNode

    del lastNode
    # End of node "Dot5"

    # Start of node "LensDistortion1"
    lastNode = app.createNode("net.sf.openfx.LensDistortion", 2, group)
    lastNode.setScriptName("LensDistortion1")
    lastNode.setLabel("LensDistortion1")
    lastNode.setPosition(871, -220)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.7, 0.3, 0.1)
    groupLensDistortion1 = lastNode

    param = lastNode.getParam("k1")
    if param is not None:
        param.setValue(-0.05, 0)
        del param

    param = lastNode.getParam("black_outside")
    if param is not None:
        param.setValue(True)
        del param

    del lastNode
    # End of node "LensDistortion1"

    # Start of node "LensDistortion2"
    lastNode = app.createNode("net.sf.openfx.LensDistortion", 2, group)
    lastNode.setScriptName("LensDistortion2")
    lastNode.setLabel("LensDistortion2")
    lastNode.setPosition(1086, 963)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.7, 0.3, 0.1)
    groupLensDistortion2 = lastNode

    param = lastNode.getParam("k1")
    if param is not None:
        param.setValue(0.02, 0)
        del param

    param = lastNode.getParam("k2")
    if param is not None:
        param.setValue(-0.005, 0)
        del param

    param = lastNode.getParam("asymmetricDistortion")
    if param is not None:
        param.setValue(-0.0025, 0)
        param.setValue(-0.0025, 1)
        del param

    del lastNode
    # End of node "LensDistortion2"

    # Start of node "DirBlur1_1_1"
    lastNode = app.createNode("net.sf.openfx.DirBlur", 1, group)
    lastNode.setScriptName("DirBlur1_1_1")
    lastNode.setLabel("Blur_G_in")
    lastNode.setPosition(359, 351)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.8, 0.5, 0.3)
    groupDirBlur1_1_1 = lastNode

    param = lastNode.getParam("scale")
    if param is not None:
        param.setValue(1.02, 0)
        param.setValue(0.95, 1)
        del param

    param = lastNode.getParam("uniform")
    if param is not None:
        param.setValue(True)
        del param

    param = lastNode.getParam("skewOrder")
    if param is not None:
        param.set("XY")
        del param

    param = lastNode.getParam("filter")
    if param is not None:
        param.set("Impulse")
        del param

    param = lastNode.getParam("motionBlur")
    if param is not None:
        param.setValue(0.0001, 0)
        del param

    del lastNode
    # End of node "DirBlur1_1_1"

    # Start of node "DirBlur1_2"
    lastNode = app.createNode("net.sf.openfx.DirBlur", 1, group)
    lastNode.setScriptName("DirBlur1_2")
    lastNode.setLabel("Blur_G_out")
    lastNode.setPosition(357, 474)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.8, 0.5, 0.3)
    groupDirBlur1_2 = lastNode

    param = lastNode.getParam("scale")
    if param is not None:
        param.setValue(0.98, 0)
        param.setValue(1.02, 1)
        del param

    param = lastNode.getParam("uniform")
    if param is not None:
        param.setValue(True)
        del param

    param = lastNode.getParam("skewOrder")
    if param is not None:
        param.set("XY")
        del param

    param = lastNode.getParam("filter")
    if param is not None:
        param.set("Impulse")
        del param

    param = lastNode.getParam("motionBlur")
    if param is not None:
        param.setValue(0.0001, 0)
        del param

    del lastNode
    # End of node "DirBlur1_2"

    # Start of node "Switch1"
    lastNode = app.createNode("net.sf.openfx.switchPlugin", 1, group)
    lastNode.setScriptName("Switch1")
    lastNode.setLabel("Switch1")
    lastNode.setPosition(1087, -48)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.3, 0.37, 0.776)
    groupSwitch1 = lastNode

    param = lastNode.getParam("which")
    if param is not None:
        param.setValue(0, 0)
        del param

    del lastNode
    # End of node "Switch1"

    # Start of node "Dot6"
    lastNode = app.createNode("fr.inria.built-in.Dot", 1, group)
    lastNode.setScriptName("Dot6")
    lastNode.setLabel("Dot6")
    lastNode.setPosition(1132, -205)
    lastNode.setSize(15, 15)
    lastNode.setColor(0.7, 0.7, 0.7)
    groupDot6 = lastNode

    del lastNode
    # End of node "Dot6"

    # Start of node "Switch1_1"
    lastNode = app.createNode("net.sf.openfx.switchPlugin", 1, group)
    lastNode.setScriptName("Switch1_1")
    lastNode.setLabel("Switch1_1")
    lastNode.setPosition(1084, 655)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.3, 0.37, 0.776)
    groupSwitch1_1 = lastNode

    param = lastNode.getParam("which")
    if param is not None:
        param.setValue(0, 0)
        del param

    del lastNode
    # End of node "Switch1_1"

    # Start of node "Dot4"
    lastNode = app.createNode("fr.inria.built-in.Dot", 1, group)
    lastNode.setScriptName("Dot4")
    lastNode.setLabel("Dot4")
    lastNode.setPosition(403, -33)
    lastNode.setSize(15, 15)
    lastNode.setColor(0.7, 0.7, 0.7)
    groupDot4 = lastNode

    del lastNode
    # End of node "Dot4"

    # Start of node "Dot7"
    lastNode = app.createNode("fr.inria.built-in.Dot", 1, group)
    lastNode.setScriptName("Dot7")
    lastNode.setLabel("Dot7")
    lastNode.setPosition(932, 985)
    lastNode.setSize(15, 15)
    lastNode.setColor(0.7, 0.7, 0.7)
    groupDot7 = lastNode

    del lastNode
    # End of node "Dot7"

    # Start of node "Shuffle2"
    lastNode = app.createNode("net.sf.openfx.ShufflePlugin", 2, group)
    lastNode.setScriptName("Shuffle2")
    lastNode.setLabel("Shuffle2")
    lastNode.setPosition(142, 654)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.6, 0.24, 0.39)
    groupShuffle2 = lastNode

    param = lastNode.getParam("outputChannelsChoice")
    if param is not None:
        param.setValue("Color.RGBA")
        del param

    param = lastNode.getParam("outputRChoice")
    if param is not None:
        param.setValue("A.r")
        del param

    param = lastNode.getParam("outputG")
    if param is not None:
        param.set("B.g")
        del param

    param = lastNode.getParam("outputGChoice")
    if param is not None:
        param.setValue("B.g")
        del param

    param = lastNode.getParam("outputBChoice")
    if param is not None:
        param.setValue("A.b")
        del param

    param = lastNode.getParam("outputAChoice")
    if param is not None:
        param.setValue("A.a")
        del param

    del lastNode
    # End of node "Shuffle2"

    # Start of node "Shuffle3"
    lastNode = app.createNode("net.sf.openfx.ShufflePlugin", 2, group)
    lastNode.setScriptName("Shuffle3")
    lastNode.setLabel("Shuffle3")
    lastNode.setPosition(886, 654)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.6, 0.24, 0.39)
    groupShuffle3 = lastNode

    param = lastNode.getParam("outputChannelsChoice")
    if param is not None:
        param.setValue("Color.RGBA")
        del param

    param = lastNode.getParam("outputRChoice")
    if param is not None:
        param.setValue("A.r")
        del param

    param = lastNode.getParam("outputGChoice")
    if param is not None:
        param.setValue("A.g")
        del param

    param = lastNode.getParam("outputB")
    if param is not None:
        param.set("B.b")
        del param

    param = lastNode.getParam("outputBChoice")
    if param is not None:
        param.setValue("B.b")
        del param

    param = lastNode.getParam("outputAChoice")
    if param is not None:
        param.setValue("A.a")
        del param

    del lastNode
    # End of node "Shuffle3"

    # Now that all nodes are created we can connect them together, restore expressions
    groupOutput1.connectInput(0, groupMerge3)
    groupShuffle1.connectInput(1, groupDot2)
    groupDot2.connectInput(0, groupDot4)
    groupShuffle1_1.connectInput(1, groupDot2)
    groupShuffle1_1_1.connectInput(1, groupDot2)
    groupDirBlur1.connectInput(0, groupShuffle1)
    groupDirBlur1_1.connectInput(0, groupShuffle1_1_1)
    groupMerge3.connectInput(0, groupDot5)
    groupMerge3.connectInput(1, groupSwitch1_1)
    groupDot5.connectInput(0, groupDot6)
    groupLensDistortion1.connectInput(0, groupDot6)
    groupLensDistortion2.connectInput(0, groupDot7)
    groupDirBlur1_1_1.connectInput(0, groupShuffle1_1)
    groupDirBlur1_2.connectInput(0, groupDirBlur1_1_1)
    groupSwitch1.connectInput(0, groupDot6)
    groupSwitch1.connectInput(1, groupLensDistortion1)
    groupDot6.connectInput(0, groupInput1)
    groupSwitch1_1.connectInput(0, groupShuffle3)
    groupSwitch1_1.connectInput(1, groupLensDistortion2)
    groupDot4.connectInput(0, groupSwitch1)
    groupDot7.connectInput(0, groupShuffle3)
    groupShuffle2.connectInput(0, groupDirBlur1_2)
    groupShuffle2.connectInput(1, groupDirBlur1)
    groupShuffle3.connectInput(0, groupDirBlur1_1)
    groupShuffle3.connectInput(1, groupShuffle2)

    param = groupDirBlur1.getParam("scale")
    param.setExpression("1-(thisGroup.disp.get()/10)", False, 0)
    param.setExpression("1+(thisGroup.disp.get()/10)", False, 1)
    del param
    param = groupDirBlur1.getParam("motionBlur")
    param.setExpression("thisGroup.sample.get()", False, 0)
    del param
    param = groupDirBlur1_1.getParam("scale")
    param.setExpression("1+(thisGroup.disp.get()/10)", False, 0)
    del param
    param = groupDirBlur1_1.getParam("motionBlur")
    param.setExpression("thisGroup.sample.get()", False, 0)
    del param
    param = groupLensDistortion1.getParam("k1")
    param.setExpression("-thisGroup.border.get()/10", False, 0)
    del param
    param = groupLensDistortion2.getParam("k1")
    param.setExpression("thisGroup.border.get()/10", False, 0)
    del param
    param = groupLensDistortion2.getParam("k2")
    param.setExpression("-thisGroup.border.get()/100", False, 0)
    del param
    param = groupLensDistortion2.getParam("asymmetricDistortion")
    param.setExpression("-thisGroup.border.get()/200", False, 0)
    param.setExpression("-thisGroup.border.get()/200", False, 1)
    del param
    param = groupDirBlur1_1_1.getParam("translate")
    param.slaveTo(groupDirBlur1_1.getParam("translate"), 0, 0)
    param.slaveTo(groupDirBlur1_1.getParam("translate"), 1, 1)
    del param
    param = groupDirBlur1_1_1.getParam("rotate")
    param.slaveTo(groupDirBlur1_1.getParam("rotate"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("scale")
    param.setExpression("1+(thisGroup.disp.get()/10)", False, 0)
    param.slaveTo(groupDirBlur1_1.getParam("scale"), 0, 0)
    param.slaveTo(groupDirBlur1_1.getParam("scale"), 1, 1)
    del param
    param = groupDirBlur1_1_1.getParam("uniform")
    param.slaveTo(groupDirBlur1_1.getParam("uniform"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("skewX")
    param.slaveTo(groupDirBlur1_1.getParam("skewX"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("skewY")
    param.slaveTo(groupDirBlur1_1.getParam("skewY"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("skewOrder")
    param.slaveTo(groupDirBlur1_1.getParam("skewOrder"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("center")
    param.slaveTo(groupDirBlur1_1.getParam("center"), 0, 0)
    param.slaveTo(groupDirBlur1_1.getParam("center"), 1, 1)
    del param
    param = groupDirBlur1_1_1.getParam("interactive")
    param.slaveTo(groupDirBlur1_1.getParam("interactive"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("invert")
    param.slaveTo(groupDirBlur1_1.getParam("invert"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("filter")
    param.slaveTo(groupDirBlur1_1.getParam("filter"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("clamp")
    param.slaveTo(groupDirBlur1_1.getParam("clamp"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("black_outside")
    param.slaveTo(groupDirBlur1_1.getParam("black_outside"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("motionBlur")
    param.setExpression("thisGroup.sample.get()", False, 0)
    param.slaveTo(groupDirBlur1_1.getParam("motionBlur"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("maskInvert")
    param.slaveTo(groupDirBlur1_1.getParam("maskInvert"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("mix")
    param.slaveTo(groupDirBlur1_1.getParam("mix"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("onParamChanged")
    param.slaveTo(groupDirBlur1_1.getParam("onParamChanged"), 0, 0)
    del param
    param = groupDirBlur1_1_1.getParam("onInputChanged")
    param.slaveTo(groupDirBlur1_1.getParam("onInputChanged"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("translate")
    param.slaveTo(groupDirBlur1.getParam("translate"), 0, 0)
    param.slaveTo(groupDirBlur1.getParam("translate"), 1, 1)
    del param
    param = groupDirBlur1_2.getParam("rotate")
    param.slaveTo(groupDirBlur1.getParam("rotate"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("scale")
    param.setExpression("1-(thisGroup.disp.get()/10)", False, 0)
    param.slaveTo(groupDirBlur1.getParam("scale"), 0, 0)
    param.setExpression("1+(thisGroup.disp.get()/10)", False, 1)
    param.slaveTo(groupDirBlur1.getParam("scale"), 1, 1)
    del param
    param = groupDirBlur1_2.getParam("uniform")
    param.slaveTo(groupDirBlur1.getParam("uniform"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("skewX")
    param.slaveTo(groupDirBlur1.getParam("skewX"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("skewY")
    param.slaveTo(groupDirBlur1.getParam("skewY"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("skewOrder")
    param.slaveTo(groupDirBlur1.getParam("skewOrder"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("center")
    param.slaveTo(groupDirBlur1.getParam("center"), 0, 0)
    param.slaveTo(groupDirBlur1.getParam("center"), 1, 1)
    del param
    param = groupDirBlur1_2.getParam("interactive")
    param.slaveTo(groupDirBlur1.getParam("interactive"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("invert")
    param.slaveTo(groupDirBlur1.getParam("invert"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("filter")
    param.slaveTo(groupDirBlur1.getParam("filter"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("clamp")
    param.slaveTo(groupDirBlur1.getParam("clamp"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("black_outside")
    param.slaveTo(groupDirBlur1.getParam("black_outside"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("motionBlur")
    param.setExpression("thisGroup.sample.get()", False, 0)
    param.slaveTo(groupDirBlur1.getParam("motionBlur"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("maskInvert")
    param.slaveTo(groupDirBlur1.getParam("maskInvert"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("mix")
    param.slaveTo(groupDirBlur1.getParam("mix"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("onParamChanged")
    param.slaveTo(groupDirBlur1.getParam("onParamChanged"), 0, 0)
    del param
    param = groupDirBlur1_2.getParam("onInputChanged")
    param.slaveTo(groupDirBlur1.getParam("onInputChanged"), 0, 0)
    del param
    param = groupSwitch1.getParam("which")
    param.setExpression("thisGroup.use_border.get()", False, 0)
    del param
    param = groupSwitch1_1.getParam("which")
    param.setExpression("thisGroup.use_border.get()", False, 0)
    param.slaveTo(groupSwitch1.getParam("which"), 0, 0)
    del param
    param = groupSwitch1_1.getParam("onParamChanged")
    param.slaveTo(groupSwitch1.getParam("onParamChanged"), 0, 0)
    del param
    param = groupSwitch1_1.getParam("onInputChanged")
    param.slaveTo(groupSwitch1.getParam("onInputChanged"), 0, 0)
    del param

    try:
        extModule = sys.modules["Chromatic_AberrationExt"]
    except KeyError:
        extModule = None
    if extModule is not None and hasattr(extModule ,"createInstanceExt") and hasattr(extModule.createInstanceExt,"__call__"):
        extModule.createInstanceExt(app,group)
