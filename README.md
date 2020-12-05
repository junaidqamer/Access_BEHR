<h1 align="center">
Access BEHR :electron:
</h1>



Developed by fellow classmates of the Columbia University Fu Foundation School of Engineering Financial Technology Bootcamp, Access is the future of HealthCare as we know it. Access puts you in control with your life at your fingertips. Access is a decentralized medical record system that allows patients to have full access of their medical records wherever and whenever. It allows patients control to forward their updated health profile to the provider of their choice. Now a patient from Alabama can be seen in Michigan and receive expeditious and thorough analysis because their medical records are accessible. That same patient could also be seen in Brazil with no issue. We live in a world of global markets, a world of travel, there are truly no borders so why should our medical records have them?

Why Access? Currently, there is no centralized or decentralized database of patients’ health records. Databases are fragmented and complete picture of patients’ records are not accessible by new providers. Access gives patients power to forward their updated health records to the provider of their choice.

Access uses Solidity an object-oriented programming language to create smart contracts with Ethereum that the Provider then deploys for each respective visit onto the blockchain. The patients private key is then used much like a social security number. The patient can see another Provider, give the private key, and the new provider will have access to all Medical History. Possibilities here are limitless. Future plans include integration through devices like smart watches and cellphones to notify and remind patients about things discussed in previous visits such as vitals, problems, health plans, and health goals to keep patients on track. Again access is about life at your fingertips. Access keeps you in the know and keeps your health at the forefront of your life. Welcome to the future of HealthCare.

<h2 align="center">
What is EHR (Electronic Health Record) ?
</h2>
 

EHR is a digital form of a medical record. They have actually been in used since the 1970s but were limited to large hospital systems as they were costly to maintain. With the passage of the Patient Protection and Affordable Care act on 6/28/2012. All medical providers were mandated to transition from paper charts to digital medical charts.The original idea was to have a unified charting system that could be accessed anywhere in the country by any medical provider. Of course, that’s not what happened. Currently by most estimates there’s currently 500 EHR vendors and none of them communicate with each other.

<h2 align="center">
What are the current issues with the status quo?
</h2>

There are currently too many vendors that lack communication and uniformity between each EHR provider. Patient's lack control and access to their health records leaving them vulnerable. If patients get sick outside of your residence, it is difficult for outside providers to have access to health records. Another issues with current EHR systems is their costs. This leaves mom and pop operations that are already struggling under the thumb and will of insurance companies and reimbursement policies vulnerable. These high costs have forced private practitioners into joining large hospital systems where they are severely underpaid and limit their practice. 
Another hurdle is that current record systems have the ability to have visits be reopened and altered leaving providers open to lawsuits.


<h2 align="center">
How can **Blockchain** fix it?
</h2>

<p align="center">
 <img src="https://media.giphy.com/media/W2uXnF6L2DUOYyzWXm/giphy.gif" width="300" height="300" />
</h2>


1. By decentralizing health records, there’s no ownership of the records by any one vendor or provider.

2. Patients keep their medical record in their blockchain wallet. They do not need to fill out forms or have to call providers for copies of their records.

3. By creating a decentralized electronic record anyone anywhere can have access without having to contact for Access to server, as long as you have the appropriate credentials.

4. Blockchain EHR can be more affordable to small fish providers, as the costly fees required to run and establish servers no longer apply.

5. Blockchain can’t be altered, therefore the medical record stays intact.

<h2 align="center">
What is HIPPA? (Not to be confused with hippo!)
</h2>

<p align="center">
 <img src="https://media.giphy.com/media/h2oj6BOcsc8Fi/giphy.gif" width="300" height="300" />
</h2>


The Health Insurance Portability and Accountability Act of 1996, commonly known as HIPAA, is a series of regulatory standards that outline the lawful use and disclosure of protected health information (PHI). HIPAA compliance is regulated by the Department of Health and Human Services (HHS) and enforced by the Office for Civil Rights (OCR). 
HIPPA was established to protect your  health records and financial health records. It provides ACCESS to patient’s to their own medical records, as well as dictating who this information can be shared with. 
It also sets standards of how private health information can be shared, transmitted, and handled.
Bad things happen to those who mishandle PHI.

<h2 align="center">
Federal requirements for an Electronic Health Record system.
</h2>


1. PATIENT SAFETY- Everything needs to be reviewed, nothing can be dropped, FOLLOW UP.

2. DATA SHARING- The ability to share data easily.

3. DOCUMENTATION- Everything needs to be well documented and signed off.

4. PRIVACY AND SECURITY- Everything done in an EHR needs to be tracked. This is a huge requirement by HIPPA.

5. PATIENT ENGAGEMENT- Patient have to be involved with their care and kept up to date with everything pertaining to their health.

<h2 align="center">
How does *Access* meet these requirements?
</h2>

1. PATIENT SAFETY- 

2. DATA SHARING- Data will be shared by sharing a private key. Patient have read only capabilities and their medical record will sit in their wallets but providers will use the private key to create and deploy a contract/office visit. Private keys serves the same function as a medical record number or even a social security number.

3. DOCUMENTATION- This fits in with privacy. Records can’t be tampered with once the block is closed.

4. PRIVACY & SECURITY- Blocks are secured through cryptography. Each participant has their own keys/ digital signatures this would allow for easy transaction identification. Because each visit will be a block, once it is closed it can not be reopened and it keeps records from being tampered. 

5. PATIENT ENGAGEMENT- Patient’s are kept in the loop of their own health as their medical records are kept in their wallet versus in a server that patient’s can’t access.

<h2 align="center">
How will Access work?
</h2>

Patients will own their health record in their personal wallet. Although, they will have view only capabilities to avoid health records from being altered.
When a new provider visit is scheduled, patients will hand over their personal key to their wallet to their new provider.
Providers will essentially begin a new contract or launch a new block in the patient’s chain. (Each new visit is a block). (Providers have viewing and writing capabilities).
To launch a new contract, patients will have a minimum amount of ETH in their wallet to be able to pay for their visit. (essentially there will be no outstanding bills in our future).
After a visit is closed, a request will be made for payment to the patient’s wallet.

<h2 align="center">
Templating a New Patient Visit
</h2>

DEMOGRAPHICS- Patient ID, name, DOB, relationship status, smoking status, gender, preferred pronouns, address, city, state, zip Code, family history, pre-existing conditions, and medication list.

CHIEF COMPLAINT- Why are you here today?

HPI (history of present illness)- What got you here today? What have you been doing thus far? Short history.

Allergies, surgical history

PHYSICAL EXAM

VITALS

LAB AND RADIOLOGY RESULTS

ASSESSMENT AND FINDINGS: Conclusions and plans based on today’s visit.

TEST ORDERED- RX, lab test, radiology.

COST OF VISIT


<h2 align="center">
Coding with Solidity
</h2>


### Creating a contract:

![alt text](https://github.com/junaidqamer/Access_BEHR/blob/main/Images/Creating%20a%20contract%201..png)

### **We initiate our contract by listing our variables, and creating a way to keep track a count of visits. We are also making it so providers are the only ones who can make edits.**



### Flags and Notifications:

![alt text](https://github.com/junaidqamer/Access_BEHR/blob/main/Images/flags%20and%20notifications%202.png)


### **These were set up to have alerts if a patient has been to the office before, how many visits, are there outstanding labs. This is anything we want to be informed about.**



### Functions:


![alt text](https://github.com/junaidqamer/Access_BEHR/blob/main/Images/functions%203.png)


### ***Setting up our visit template. as described above.***



### Connecting a Wallet with a Balance to be paid for services:

![alt text](https://github.com/junaidqamer/Access_BEHR/blob/main/Images/mapping%20connecting%20balancewallet%204%20paid.png)


### **Through mapping we are connecting a wallet with a balance in order to request a payment for the visit that will be closed.**
