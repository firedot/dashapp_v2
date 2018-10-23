# dashapp

# Prerequisites: 

 1. Download and install VirtualBox from [here](https://www.virtualbox.org/wiki/Downloads)
 2. Download Vagrant from [here](https://www.vagrantup.com/downloads.html)


## How to use this repository: 

1. Clone this repository by running the following command: 

```
git clone https://github.com/firedot/dashapp_v2.git
```

2. Go into the cloned repository directory: 

```
cd dashapp_v2
```
3. Run the following command: 

```
vagrant up
```

4. Login to the machine by running:

```
vagrant ssh 
```

5. Execute the Dash application(app.py) in separate session by running:

```
setsid python3 /vagrant/app.py
```


## Development
 

## TO DO: 
 
 * Terraform code for provisioning into Prod

## Done

 * Prepare a nice README
 * Add Travis for testing
 * Any dev should be able to clone the repo and start working by running   ``` vagrant up ```
