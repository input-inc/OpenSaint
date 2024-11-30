![Input-Inc logo](https://www.input-inc.com/_include/img/slider-images/image01.jpg "Header")
# Welcome to OpenSAINT by Input-Inc.

OpenSAINT is a robotic platform that is a screen accurate replica of a well known movie robot. This platform represents years of mechanical design and collaboration by the Input-Inc. team. Except where noted, it is not affiliated with any persons or groups outside of its core team. Please visit our website (www.input-inc.com) for more information. Please familiarize yourself with this document before proceeding. Building a full-size OpenSAINT robot is an expensive, laborious, and time consuming process. It is recommended you have machining experience, and experience building RC controlled systems.

## Help Keep this Project ALIVE!
We've been working on this project for over twenty years, and have countless hours poured into it. We use industrial grade software and tools to bring this project to an international community of builders, and we can only continue our efforts with your help. Through our Patreon we offer several tiers for builders and non-builders alike to support the project. [Check out our Patreon](https://www.patreon.com/inputinc/)

## License Terms & Conditions
These files are provided under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International license (included), and as such this information, or derivatives thereof are intended solely for personal use and cannot be used for commercial purposes. Any distributed modifications of this information must be done under the same terms, and include the license of the original work. 

# !! WARNING !!
Before you get started be warned that this robot when built to specification can still be dangerous. Certain safety mechanisms or mechanical considerations have been designed to reduce this risk as much as possible but the design contains multiple high-powered motors, servos, and mechanisms that in their normal operation can injure the operator or bystanders. It is not recommend to run this robot without taking proper precautions to protect those within its field of operation. 

# How to get started

## Getting the current CAD
Before you download the CAD we recommend you read through our [CAD Releases](https://github.com/input-inc/OpenSaint/wiki/CAD-Releases) document. This will give you more information on our release schedules, distribution mechanisms, and recommended software. Always be sure you have the newest version of the CAD before building, and always get your CAD from the Input-Inc. GitHub repository or Patreon.

## Downloading the CAD from GitHub
GitHub is a public source control hosting and management platform. We use it to host our public CAD. For those without Git experience we recommend downloading the [Git Desktop](https://desktop.github.com) client, and using that to download the files. This will ensure that the LFS structure of the repository is retained when you download it. You will need at least 10GB of hard drive space available to download the entire CAD. 

**!! Do not use the 'Download ZIP' option in the Code dropdown on the GitHub website. That will not download the file contents !!** 
### GitHub Desktop Steps
1. Download GitHub Desktop for your operating system.
2. Install it. (For macOS open the zip file and drag the application to your `/Applications` folder.)
3. Open GitHub Desktop.
4. Select the `File` menu and select `Clone Repository`.
5. Select the `URL` tab from the dialog.
6. Enter this URL: `https://github.com/input-inc/OpenSaint.git`
7. Choose a location where you want to save the files. **IMPORTANT:** For Windows you must install at the top level of a drive like C:, because the path names will exceed the Windows maximum length if it is installed elsewhere.
8. Click the `Clone` button.
9. Wait for the repository to finish downloading.

### Git Command-line Steps
If you prefer to use the command line it will require current versions of `git` and `git lfs`. Download and install in whatever way is appropriate for your operating system.
1. `git lfs clone <repository URL> <path to save>`

## Reading the CAD

### What software do I need?
#### CAD
These CAD files are provided in SolidWorks format and we **expressly** recommend using SolidWorks to read them as outlined in our [CAD Releases](https://github.com/input-inc/OpenSaint/wiki/CAD-Releases) document. To get SolidWorks:Maker, (an affordable version of SolidWorks) you can follow the steps in our [SolidWorks Guide](https://github.com/input-inc/OpenSaint/wiki/Installing-3DExperience-SolidWorks-for-Makers).

Some software packages like Fusion 360 may only read the solid data from the file and could exclude part configurations or other details. Unless otherwise provided, parts do not include flat patterns specified for sheet metal manufacturing. An understanding of CAD tools will be required to extract usable dimensions and patterns for manufacturing.

#### Markdown
For reading the MD (Markdown) files within the repository on your desktop (you can always read them natively within Git's web interface), you'll need a compatible markdown viewer. Here are some suggestions:

##### macOS
- [The 6 Best Mac Markdown Editors](https://www.makeuseof.com/tag/mac-markdown-editors/)

##### Windows
- [The 4 Best Markdown Editors for Windows](https://www.makeuseof.com/best-markdown-editors-windows/)

## How is the CAD organized
The major sections of the robot are broken into folders and subfolders for sub-assemblies. Part files are named to make locating them within this structure as easy as possible. For example the file named: `[CRDL-COMN-C-COMN-00] Battery box.SLDPRT` , could be found at the following path:

`ROOT > [04 CRDL] Cradle Base > [ COMN] Common > [C] Battery Box > [ COMN] Common`

### Configurations and build options (ex. v1 vs. v2)
Input-Inc. uses a few ways to denote differing configurations of assemblies and part files. For certain parts a SolidWorks configuration is provided to represent earlier valid versions of the part, as we endeavor to retain backwards compatibility wherever possible. Be sure to check the configurations tab in SolidWorks to see the differing versions. For some assemblies a V1 or V2 folder can be found within the folder structure to illustrate differing approaches to building the assembly. Not all versions of all assemblies may be compatible so use caution when deviating from the default configurations.

## What you’ll need
Building OpenSAINT will require a full suite of tools, and in many cases we suggest having machining capabilities yourself to build these parts. It is strongly recommended that you fully train and familiarize yourself with any machine or tool outlined here. We accept no responsibility for injuries sustained or failed parts from improper use of these tools.

### Machines
For these machines we recommend the largest you can afford and realistically own.
- Mill (Bench top or larger)
- Lathe (Capable of cutting metal) (Bench top or larger)
- 3D printer (FDM: 350mm2 minimum recommended, Resin)

### Tools
Fractional and Metric allen wrench sets - Most of the fasteners on OpenSAINT are fractional size socket head cap screws. We recommend a quality set of these that go down to .028” and 0.7mm

## Vendors
Most off-the-shelf parts included in the CAD include part numbers for ease of searching. 

### Fasteners
- [McMaster-Carr](https://www.mcmaster.com) - Unless otherwise specified, most of the fasteners can be found here. 
- [Bolt Depot](https://boltdepot.com)
- [Fastenal](fastenal.com)

### Laser cutting
For laser cut parts we’ve found the following vendors to provide excellent results:

- [SendCutSend](https://sendcutsend.com) - 2D sheet metal, laser cutting, and some bending.
- [OSHCut](https://www.oshcut.com) - 2D sheet metal, laser cutting, and bending
- [Ponoko](https://www.ponoko.com) - Plastics laser cutting

### PCBs
- [JLPCB](https://jlpcb.com)
- [OSH Park](https://oshpark.com)
- [PCBWay](https://pcbway.com)

### Servos
- [Servo City](https://www.servocity.com) - Motors, servos, gears
- [ASME](https://www.aliexpress.com/item/32975864627.html) - Beware knock-offs. This is our recommended vendor.

### 3D Printing
- [CraftCloud](https://craftcloud3d.com) - A large marketplace for 3D printing services.

### Other Vendors
- [Bearings Direct](https://bearingsdirect.com)
- [MetalsDepot](https://www.metalsdepot.com)


## Where to get parts
- Part runs - Occasionally Input-Inc. members will have parts for sale, or do parts runs. Visit our [Facebook](https://www.facebook.com/groups/inputinc) and check the announcements for parts runs. We do our best to ensure fit and compatibility but you may still need to make adjustments on stuff.
- [OpenSAINT part Inventory](https://docs.google.com/spreadsheets/d/1wjoVz0FKgDMVw29Vhd8r6FyhR2xi7lMMy8atvSe49dA/edit?usp=sharing) - [Ramon](ryvarra@cyberantics.net) has a running inventory of parts from previous runs and general collecting. Check the list and contact through the Facebook group or by email to make a purchase. Keep in mind that inventory purchases are limited to Patreon Builder/Pro Builder members.

## Community resources
Join us on our Facebook group, and always be on the lookout for build videos.
- [Facebook](https://www.facebook.com/groups/inputinc)
- [YouTube](https://www.youtube.com/user/J5GURU)
