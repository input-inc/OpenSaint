![Input-Inc logo](https://www.input-inc.com/_include/img/slider-images/image01.jpg "Header")
# Welcome to OpenSAINT by Input-Inc.

These files represent years of hard work by the Input-Inc. team to create a robotic platform that is a screen accurate replica of a well known movie robot. These files are provided under a creative commons license (included) and may only be distributed with that license intact. Please familiarize yourself with this document and the suggestions herein. Building a full-size OpenSAINT robot is an expensive, laborious, and time consuming process. It is recommended you have machining experience, and experience building RC controlled systems.

# !! WARNING !!
Before you get started be warned that this robot when built to specification can still be dangerous. Certain safety mechanisms or mechanical considerations have been designed to reduce this risk as much as possible but the design contains multiple high-powered motors, servos, and mechanisms that in their normal operation can injure the operator or bystanders. It is not recommend to run this robot without taking proper precautions to protect those within its field of operation. 

# How to get started

## Having the current CAD version
Always be sure you have the newest version of the CAD before building, and always get your CAD from the Input-Inc. website, or public Git repository. There may be other links floating around the internet that are either our earlier work, or derivatives based on our earlier work. The Input-Inc. CAD is not guaranteed to be compatible with non-affiliated designs, and in some places it is not compatible with earlier versions of our own work. **Use caution when building**.

## Downloading the CAD
For those without Git experience we recommend downloading [Git Desktop](https://desktop.github.com) and pointing it at this repository. This will ensure that the LFS structure of the repository is retained when you clone it.
### GitHub Desktop Steps
1. Download GitHub Desktop for your operating system.
2. Install it. (For macOS open the zip file and drag the application to your `/Applications` folder.)
3. Open GitHub Desktop.
4. Select the `File` menu and select `Clone Repository`.
5. Select the `URL` tab from the dialog.
6. Enter the URL of this repository (Found in the Clone menu on the repository website. HTTPS preferred)
7. Choose a location where you want to save the files.
8. Click the `Clone` button.
9. Wait for the repository to finish downloading.

### Git Command-line Steps
This requires `git lfs`. Download and install in whatever way is appropriate for your operating system.
1. `git lfs clone <repository URL> <path to save>`

## Reading the CAD

### What software do I need?
#### CAD
These CAD files are provided in Solidworks format, and can be read by the following programs:
- SolidWorks 2022 or later (Windows only) (Professional / Maker version) - We recommend [SolidWorks Maker](https://discover.solidworks.com/makers) for maximum compatibility.
- [eDrawings 2022](https://www.edrawingsviewer.com) (macOS/Windows) - Basically a read-only version of SolidWorks that does some part conversion and dimensions.
- Fusion 360 (via conversion) (macOS/Windows) - Only converts the solid part of the default configuration. **Not recommended**.
- [OnShape](https://www.onshape.com) (Web based) (via conversion) - Only converts the solid part of the default configuration. A free and slightly better option than Fusion 360.

Some software packages may only read the solid data from the file and could exclude part configurations or other details. Unless otherwise provided parts do not include flat patterns specified for sheet metal parts. An understanding of CAD tools will be required to extract usable dimensions and patterns for manufacturing.

#### Markdown
For reading the MD (Markdown) files within the repository on your desktop (you can always read them natively within Git), you'll need a compatible markdown viewer. Here are some suggestions:

##### macOS
- [The 6 Best Mac Markdown Editors](https://www.makeuseof.com/tag/mac-markdown-editors/)

##### Windows
- [The 4 Best Markdown Editors for Windows](https://www.makeuseof.com/best-markdown-editors-windows/)

## How is the CAD organized
The major sections of the robot are broken into folders and subfolders for sub-assemblies. Part files are named to make locating them within this structure as easy as possible. For example the file: `[CRDL-COMN-C-COMN-00] Battery box.SLDPRT` Battery Tray could be found at the following path:

`ROOT > [04 CRDL] Cradle Base > [ COMN] Common > [C] Battery Box > [ COMN] Common`

### Configurations and build options (ex. v1 vs. v2)
Input-Inc. uses a few ways to denote differing configurations of assemblies and part files. For certain parts a Solidworks configuration is provided to represent earlier valid versions of the part, as we endeavor to retain backwards compatibility wherever possible. Be sure to check the configurations tab in Solidworks to see the differing versions. For some assemblies a V1 or V2 folder can be found within the folder structure to illustrate differing approaches to building the assembly. Not all versions of all assemblies may be compatible so use caution when deviating from the default configurations.

## What you’ll need
Building OpenSAINT will require a full suite of tools, and in many cases we suggest having machining capabilities yourself to build these parts. It is strongly recommended that you fully train and familiarize yourself with any machine or tool outlined here. We accept no responsibility for injuries sustained or failed parts from improper use of these tools.

### Machines
For these machines we recommend the largest you can afford and realistically own.
- Mill (Bench top or larger)
- Lathe (Capable of cutting metal) (Bench top or larger)
- 3D printer (FDM: 350mm2 minimum recommended, Resin)

### Tools
Fractional and Metric alan wrench sets - Most of the fasteners on OpenSAINT are fractional size socket head cap screws. We recommend a quality set of these that go down to .028” and 0.7mm

## Vendors
Most off-the-shelf parts included in the CAD include part numbers for ease of searching. 

### Fasteners
- [McMaster-Carr](https://www.mcmaster.com) - Unless otherwise specified, most of the fasteners can be found here. 

### Laser cutting
For last cut parts we’ve found the following vendors to provide excellent results:

- [SendCutSend](https://sendcutsend.com) - 2D sheet metal, laser cutting, and some bending.
- [OSHCut](https://www.oshcut.com) - 2D sheet metal, laser cutting, and bending
- [Ponoko](https://www.ponoko.com) - Plastics laser cutting

### PCBs
- [OSH Park](https://oshpark.com)

### Servos
- [Servo City](https://www.servocity.com) - Motors, servos, gears
- [ASME](https://www.aliexpress.com/item/32975864627.html) - Beware knock-offs. This is our recommended vendor.

### 3D Printing
- [CraftCloud](https://craftcloud3d.com) - A large marketplace for 3D printing services.

## Where to get parts
- Part runs - Occasionally Input-Inc. members will have parts for sale, or do parts runs. Visit our Facebook group and check the announcements for parts runs. We do our best to ensure fit and compatibility but you may still need to make adjustments on stuff.
- [OpenSAINT part Inventory](https://docs.google.com/spreadsheets/d/1wjoVz0FKgDMVw29Vhd8r6FyhR2xi7lMMy8atvSe49dA/edit?usp=sharing) - [Ramon](ryvarra@cyberantics.net) has a running inventory of parts from previous runs and general collecting. Check the list and contact through the Facebook group or by email to make a purchase. Keep in mind that inventory purchases are limited to Patreon Builder/Pro Builder members.

## Community resources
Join us on our Facebook group, and always be on the lookout for build videos.
- [Facebook](https://www.facebook.com/groups/inputinc)
- [YouTube](https://www.youtube.com/user/J5GURU) 
		


