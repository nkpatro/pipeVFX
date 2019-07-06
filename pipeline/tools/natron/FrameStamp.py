# -*- coding: utf-8 -*-
# DO NOT EDIT THIS FILE
# This file was automatically generated by Natron PyPlug exporter version 10.

# Hand-written code should be added in a separate file named FrameStampExt.py
# See http://natron.readthedocs.org/en/master/groups.html#adding-hand-written-code-callbacks-etc
# Note that Viewers are never exported

import NatronEngine
import sys

# Try to import the extensions file where callbacks and hand-written code should be located.
try:
    from FrameStampExt import *
except ImportError:
    pass

def getPluginID():
    return "ComunityPyPlug.FrameStamp"

def getLabel():
    return "FrameStamp"

def getVersion():
    return 3

def getIconPath():
    return "FrameStamp.png"

def getGrouping():
    return "Draw"

def getPluginDescription():
    return "A very simple Frame Stamp drawn at the bottom of the screen."

def createInstance(app,group):
    # Create all nodes in the group

    # Create the parameters of the group node the same way we did for all internal nodes
    lastNode = group

    # Create the user parameters
    lastNode.Controls = lastNode.createPageParam("Controls", "Controls")
    param = lastNode.createIntParam("textSize", "Size")
    param.setMinimum(0, 0)
    param.setDisplayMinimum(0, 0)
    param.setDisplayMaximum(100, 0)
    param.setDefaultValue(30, 0)
    param.restoreDefaultValue(0)

    # Add the param to the page
    lastNode.Controls.addParam(param)

    # Set param properties
    param.setHelp("Adjust size")
    param.setAddNewLine(True)
    param.setAnimationEnabled(False)
    param.setValue(26, 0)
    lastNode.textSize = param
    del param

    param = lastNode.createDoubleParam("Merge2mix", "Mix")
    param.setMinimum(0, 0)
    param.setMaximum(1, 0)
    param.setDisplayMinimum(0, 0)
    param.setDisplayMaximum(1, 0)
    param.setDefaultValue(1, 0)
    param.restoreDefaultValue(0)

    # Add the param to the page
    lastNode.Controls.addParam(param)

    # Set param properties
    param.setHelp("")
    param.setAddNewLine(True)
    param.setAnimationEnabled(True)
    lastNode.Merge2mix = param
    del param

    # Refresh the GUI with the newly created parameters
    lastNode.setPagesOrder(['Controls', 'Node', 'Info'])
    lastNode.refreshUserParamsGUI()
    del lastNode

    # Start of node "Output1"
    lastNode = app.createNode("fr.inria.built-in.Output", 1, group)
    lastNode.setScriptName("Output1")
    lastNode.setLabel("Output1")
    lastNode.setPosition(713, 497)
    lastNode.setSize(104, 31)
    lastNode.setColor(0.7, 0.7, 0.7)
    groupOutput1 = lastNode

    del lastNode
    # End of node "Output1"

    # Start of node "Input1"
    lastNode = app.createNode("fr.inria.built-in.Input", 1, group)
    lastNode.setScriptName("Input1")
    lastNode.setLabel("Input1")
    lastNode.setPosition(713, 312)
    lastNode.setSize(104, 31)
    lastNode.setColor(0.3, 0.5, 0.2)
    groupInput1 = lastNode

    del lastNode
    # End of node "Input1"

    # Start of node "Text2"
    lastNode = app.createNode("net.fxarena.openfx.Text", 6, group)
    lastNode.setScriptName("Text2")
    lastNode.setLabel("Text2")
    lastNode.setPosition(577, 404)
    lastNode.setSize(104, 43)
    lastNode.setColor(0.3, 0.5, 0.2)
    groupText2 = lastNode

    param = lastNode.getParam("center")
    if param is not None:
        param.setValue(20, 0)
        param.setValue(50, 1)
        del param

    param = lastNode.getParam("transform")
    if param is not None:
        param.setValue(False)
        del param

    param = lastNode.getParam("autoSize")
    if param is not None:
        param.setValue(True)
        del param

    param = lastNode.getParam("markup")
    if param is not None:
        param.setValue(True)
        del param

    param = lastNode.getParam("text")
    if param is not None:
        param.setValue("<span bgcolor=\'black\'>Frame: 00019988</span>")
        del param

    param = lastNode.getParam("font")
    if param is not None:
        param.setValue("D/DejaVu Sans")
        del param

    param = lastNode.getParam("size")
    if param is not None:
        param.setValue(26, 0)
        del param

    param = lastNode.getParam("weight")
    if param is not None:
        param.set("Bold")
        del param

    param = lastNode.getParam("stretch")
    if param is not None:
        param.set("Condensed")
        del param

    del lastNode
    # End of node "Text2"

    # Start of node "Merge1"
    lastNode = app.createNode("net.sf.openfx.MergePlugin", 1, group)
    lastNode.setScriptName("Merge1")
    lastNode.setLabel("Merge1")
    lastNode.setPosition(713, 392)
    lastNode.setSize(104, 66)
    lastNode.setColor(0.3, 0.37, 0.776)
    groupMerge1 = lastNode

    param = lastNode.getParam("BChannelsA")
    if param is not None:
        param.setValue(False)
        del param

    del lastNode
    # End of node "Merge1"

    # Now that all nodes are created we can connect them together, restore expressions
    groupOutput1.connectInput(0, groupMerge1)
    groupMerge1.connectInput(0, groupInput1)
    groupMerge1.connectInput(1, groupText2)

    param = groupText2.getParam("text")
    param.setExpression("\"<span bgcolor=\'black\'>Frame: \"+str(frame).zfill(8)+\"</span>\"", False, 0)
    del param
    param = groupText2.getParam("size")
    param.slaveTo(group.getParam("textSize"), 0, 0)
    del param

    try:
        extModule = sys.modules["FrameStampExt"]
    except KeyError:
        extModule = None
    if extModule is not None and hasattr(extModule ,"createInstanceExt") and hasattr(extModule.createInstanceExt,"__call__"):
        extModule.createInstanceExt(app,group)
