# referenzmodul_demoapplikation

## SETUP

* This app requires no additional Setup
* This app is for demonstrating purposes only

## ENVIRONMENTS

### Staging

The app has no staging system

### Production

The app has no productive system

### Local Server

The app will run on a local machine for demonstrating purposes


## PITFALLS
### Problems with solutions

[Reference].main_asset will throw an error if no assets are present.
this is only called on active references and it is not possible to activate a reference without assets


### Problems without solutions

filter criterias wich mach no reference are selectable resulting in no reference output - don't create topics, branches or services associated to no reference!


## HOWTO / INFO

Once the app is running, all functionalities are available

filter criterias (topics, services, branches) are best to be created before the references for easy selecting

the 'activate' button will remain disabled until at least one asset is present - deleting all its assets wil deactivate a reference

ordering elements (references, asset) is done by drag and drop. changes are submitted instantly, no further saving required

if no asset is specified as main asset, the first one will act as main asset
