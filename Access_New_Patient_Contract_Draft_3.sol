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



//import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

contract PatientVisit {
    
    constructor() public {
        address payable provider = msg.sender;
        address payable patient; 
        string memory ReasonForVisit;
    }
    
    using Counters for Counters.Counter;
   // Counters.Counter patientIds;
    Counters.Counter private visitCount;
    
    modifier only_admin{
        require(msg.sender==provider);
        _;}
    
    mapping(address=>informationAndDemographics) _patientsData;
    
    uint[] private patientIds;
    
    //New patient added
    event NewPatient(string condition); //(uint token_id, uint appraisal_value, string report_uri);
   
    //Duplicate patient, increment visitcount. 
    event PreviousPatient(string condition);
    
    //Labs ordered.
    //event
    
    // Referral ordered.
    //event
    
    //Medication ordered.
    //event
    
    //Reschedule/ Follow-Up Notification
    //event
    
    struct informationAndDemographics{
        string patientName; 
        string patientDoB;
        bool NewPatient;
        string patientGenderId;
        string patientRelationshipStatus;
        string patientSexuality;
        string patientPreferredPronoun;
        bool patientMarried;
        bool patientSmoker;
        bool patientAlcohol;
        string patientAddress;
        string patientCity;
        string patientState;
        string patientZip;
        string patientCountry;
        string patientPhoneNo;
        string patientFamilyHistory;
        string patientPreExistingConditions;
        string patientAllergies;
        string patientMedicationList;}
    
    informationAndDemographics patientData;

//Break the code below into multiple functions.
  function addPatientInfo(
        string memory _patientName, 
        string memory _patientDoB,
        bool _NewPatient,
        string memory _patientGenderId,
        string memory _patientRelationshipStatus,
        string memory _patientSexuality,
        string memory _patientPreferredPronoun,
        bool _patientMarried,
        bool _patientSmoker,
        bool _patientAlcohol,
        string memory _patientAddress,
        string memory _patientCity,
        string memory _patientState,
        string memory _patientZip,
        string memory _patientCountry,
        string memory _patientPhoneNo,
        string memory _patientFamilyHistory,
        string memory _patientPreExistingConditions,
        string memory _patientAllergies,
        string memory _patientMedicationList) only_admin public returns(bool) {
            if (_NewPatient == false) {
                emit PreviousPatient('This patient has been previously seen here, this will be a duplicate patient. Look at previous blocks with patient ID and privateKey. Visit will be added to visit count.');
                visitCount.increment();
            }
            else {
                 patientData = informationAndDemographics(_patientName,_patientDoB,_NewPatient, _patientGenderId,_patientRelationshipStatus, _patientSexuality,
                 _patientPreferredPronoun, _patientMarried, _patientSmoker, _patientAlcohol, _patientAddress, _patientCity, _patientState, _patientZip, _patientCountry, _patientPhoneNo,
                 _patientFamilyHistory, _patientPreExistingConditions, _patientAllergies, _patientMedicationList);
                 
                 /*,2 3,)
                 //informationAndDemographics.patientName=_patientName; 
                 //informationAndDemographics.patientDoB=_patientDoB;
                 informationAndDemographics.NewPatient=_NewPatient; 
                 informationAndDemographics.patientGenderId=_patientGenderId;
                 informationAndDemographics.patientRelationshipStatus=_patientRelationshipStatus;
                 informationAndDemographics.patientSexuality=_patientSexuality;
                 informationAndDemographics.patientPreferredPronoun=_patientPreferredPronoun;
                 informationAndDemographics.patientMarried=_patientMarried;
                 informationAndDemographics.patientSmoker=_patientSmoker;
                 informationAndDemographics.patientAlcohol=_patientAlcohol;
                 informationAndDemographics.patientAddress=_patientAddress;
                 informationAndDemographics.patientCity=_patientCity;
                 informationAndDemographics.patientState=_patientState;
                 informationAndDemographics.patientZip=_patientZip;
                 informationAndDemographics.patientCountry=_patientCountry;
                 informationAndDemographics.patientPhoneNo=_patientPhoneNo;
                 informationAndDemographics.patientFamilyHistory=_patientFamilyHistory;
                 informationAndDemographics.patientPreExistingConditions=_patientPreExistingConditions;
                 informationAndDemographics.patientMedicationList=_patientMedicationList;} */
                 
                 emit NewPatient('A new patient has been added succesfully.');
                
            }
}
    address payable provider = msg.sender;
    address payable patient; 

    function setReasonForVisit(string memory _chiefComplaint) only_admin private {
        require(provider == msg.sender, "You are not authorized to create or edit medical records!");
        string memory ReasonForVisit = _chiefComplaint;
    }
    
    //function getReasonForVisit() private view returns(string storage ReasonForVisit){ } 
        
}