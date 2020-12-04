pragma solidity ^0.5.5;
// A template for Doctor Visits
// Each visit is a contract that will be deployed onto the Blockchain

//WHAT IS REQUESTED IN CONTRACT
// 1. minting for the patients to have an ability to pay. fixed amount of tokens. use a require for minting. 
//balance of this wallet has to be greater than x amount to mint tokens.
//(Maybe this is a seperate contract Access (us) has deployed on blockchain that patients can go to.)

//demo visit: reason for visit, HPI- history of present illness, vitals, medication list, physical exam, 
//laboratory review, radiology review, assessment:
//where you write a summary of findings and what. you want the patient to do. test orders: 
//test ordered during that visit. credits due: total credits due for the visit.
//payer system aka self pay- provider request to patient.

// In the future will develop a counter system that adds new patients to another contract consisting of all the patients.?

//import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

contract patientVisit {
    
    constructor() public {
        address payable provider = msg.sender;
        address payable patient; 
    }
    
    string reasonForVisit;
    string finalAssessment;
    uint[] labOrders;
    address[] referralAddresses;
    string referralNotes;
    
    using Counters for Counters.Counter;
    Counters.Counter private visitCount;
    
    //Only the provider can make edits and etc.
    modifier onlyAdmin{
        require(msg.sender==provider);
        _;}
    
    //New patient added
    event newPatient(string condition);
   
    //Duplicate patient, increment visitcount. 
    event previousPatient(string condition);
    
    //Labs ordered.
    event labsOrdered(string condition);
    
    // Referral ordered.
    event referralOrdered(string condition);
    
    //Medication ordered.
    event medicationOrdered(string condition);
    
    //Reschedule/ Follow-Up Notification
    event followUpNeeded(string condition);
    
    struct questionnaire{
        string patientName; 
        string patientDoB;
        string patientGenderId;
        string patientRelationshipStatus;
        string patientSexuality;
        string patientPreferredPronoun;
        bool patientMarried;
        bool patientSmoker;
        bool patientAlcohol;
        string patientFamilyHistory;
        string patientPreExistingConditions;
        string surgicalHistory;
        string patientAllergies;
        string patientMedicationList;}
    
    struct demographics{
        bool newPatient;
        string patientAddress;
        string patientCity;
        string patientState;
        string patientZip;
        string patientCountry;
        string patientPhoneNo;}
        
    struct vitals{
        string height;
        uint weight;
        uint bloodPressure;
        string temperature;}
    
    questionnaire patientQuestionnaire;
    demographics patientDemographics;
    vitals patientVitals;
    
// Demographics will always be first thing reviewed. 
  function addPatientDemographics(
        bool _newPatient,
        string memory _patientAddress,
        string memory _patientCity,
        string memory _patientState,
        string memory _patientZip,
        string memory _patientCountry,
        string memory _patientPhoneNo) onlyAdmin public {
            if (_newPatient == false) {
                emit previousPatient('This patient has been previously seen here, this will be a duplicate patient. Look at previous blocks with patient ID and privateKey. Visit will be added to visit count.');
                visitCount.increment();
            }
            else {
                patientDemographics = demographics(_newPatient, _patientAddress,_patientCity,_patientState,_patientZip,_patientCountry,_patientPhoneNo);
            }
        }
        
        
  function addPatientQuestionnaire(
        string memory _patientName, 
        string memory _patientDoB,
        string memory _patientGenderId,
        string memory _patientRelationshipStatus,
        string memory _patientSexuality,
        string memory _patientPreferredPronoun,
        bool _patientMarried,
        bool _patientSmoker,
        bool _patientAlcohol,
        string memory _patientFamilyHistory,
        string memory _patientPreExistingConditions,
        string memory _surgicalHistory,
        string memory _patientAllergies,
        string memory _patientMedicationList) onlyAdmin public {
                 patientQuestionnaire = questionnaire(_patientName,_patientDoB,_patientGenderId, _patientRelationshipStatus, _patientSexuality,
                 _patientPreferredPronoun, _patientMarried, _patientSmoker, _patientAlcohol,_patientFamilyHistory, _patientPreExistingConditions, _surgicalHistory, _patientAllergies, _patientMedicationList);
                 emit newPatient('A new patient has been added succesfully.');
                
            }

    address payable provider = msg.sender;
    address payable patient; 

    function setReasonForVisit(string memory _chiefComplaint)  onlyAdmin public {
        require(provider == msg.sender, "You are not authorized to create or edit medical records!");
        reasonForVisit = _chiefComplaint;
    }
    
    // Eventually make this private possibly.
    function getReasonForVisit() public view returns(string memory){
        return reasonForVisit;
        
    } 
    
    function getVitals(
        string memory _height,
        uint _weight,
        uint _bloodPressure,
        string memory _temperature) onlyAdmin public {
            patientVitals = vitals(_height,_weight,_bloodPressure,_temperature);
        }
    
    //Here the provider will give notes/findings from the physical exam.
    // While a physical exam is different from a general visit we are combining both here for a general assessment. 
    function physicalExam(string memory _assessment) onlyAdmin public {
        finalAssessment = _assessment;
    }
    
    function getPhysicalExam() public view returns(string memory){
        return finalAssessment;
    }
    
    //ORDERS 
    
    //Bloodwork/labs
    function orderLabs(uint[] memory _orderNumbers) public {
        labOrders = _orderNumbers;
        emit labsOrdered('Labs have been ordered. Please folow-up within the designated period.');
    }
    
    function getLabOrders() view public returns(uint[] memory){
        return labOrders;
    }
    
    //Future add-on to request lab results.
    function requestLabResults() view public returns(string memory){ }
    
    //Referral
    function orderReferral(address[] memory _referralAddress, string memory _referralNotes) public {
        referralAddresses = _referralAddress;
        referralNotes = _referralNotes;
        emit referralOrdered('The referral process has been initiated. Please follow-up within the designated period.');
        
    }
    
    function getReferralAddresses() view public returns(address[] memory){
        return referralAddresses;
    }
    
    function getReferralNotes() view public returns(string memory){
        return referralNotes;
    }
    //Future add-on to request referral results.
    function getReferralResults() view public returns(string memory){ }
    
    
    
    
    //Medication

    
    
    //VISIT SUMMARY 
    
    
    //PAYMENT



        
}