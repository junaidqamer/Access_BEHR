pragma solidity ^0.5.0;
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
        string memory ReasonForVisit="";
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
    event Message(); //(uint token_id, uint appraisal_value, string report_uri);
   
    //Duplicate patient, increment visitcount. 
    //event
    
    //Labs ordered.
    //event
    
    // Referral ordered.
    //event
    
    //Medication ordered.
    //event
    
    //Reschedule/ Follow-Up Notification
    //event
    
    struct informationAndDemographics{
        uint patientId;
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
        string patientMedicationList;}
    
    function addPatientInfo(
        uint _patientId,
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
            //var _patientData=_patientsData[_patientId];
            //a patient address/ID can be added only once
            if(bytes(_NewPatient == "False")){
                emit Message('This patient has been previously seen here, this will be a duplicate patient. Look at previous blocks with patient ID and privateKey. Visit will be added to visit count.');
                visitCount.increment() ;}
            //Look at stopping the function above when new patient is false.
            else {
                 _patientsData.patientId= _patientId;
                 _patientsData.patientName=_patientName; 
                 _patientsData.patientDoB=_patientDoB;
                 _patientsData.NewPatient=_NewPatient; 
                 _patientsData.patientGenderId=_patientGenderId;
                 _patientsData.patientRelationshipStatus=_patientRelationshipStatus;
                 _patientsData.patientSexuality=_patientSexuality;
                 _patientsData.patientPreferredPronoun=_patientPreferredPronoun;
                 _patientsData.patientMarried=_patientMarried;
                 _patientsData.patientSmoker=_patientSmoker;
                 _patientsData.patientAlcohol=_patientAlcohol;
                 _patientsData.patientAddress=_patientAddress;
                 _patientsData.patientCity=_patientCity;
                 _patientsData.patientState=_patientState;
                 _patientsData.patientZip=_patientZip;
                 _patientsData.patientCountry=_patientCountry;
                 _patientsData.patientPhoneNo=_patientPhoneNo;
                 _patientsData.patientFamilyHistory=_patientFamilyHistory;
                 _patientsData.patientPreExistingConditions=_patientPreExistingConditions;
                 _patientsData.patientMedicationList=_patientMedicationList;}
                 patientIds.push(_patientId);
                 emit Message('A new patient has been added succesfully.');
                 return true;}

    address payable provider = msg.sender;
    address payable patient; 
    
    function setReasonForVisit(string memory _chiefComplaint) private returns(string memory) {
        require(provider == msg.sender, "You are not authorized to create or edit medical records!");
        string memory ReasonForVisit = _chiefComplaint;
    }
    function getReasonForVisit() private view  returns(string memory) {
        return ReasonForVisit;
}
}