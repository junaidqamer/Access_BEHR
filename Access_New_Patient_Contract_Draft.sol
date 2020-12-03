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



import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

contract PatientVisit {
    
    constructor() public {
        address payable provider = msg.sender;
        address payable patient; 
        string memory ReasonForVisit;
    }
    
    using Counters for Counters.Counter;
    Counters.Counter patientIds;
    Counters.Counter visitCount;
    
    modifier only_admin{
        require(msg.sender==provider);
        _;}
    mapping(address=>informationAndDemographics) _patientsData;
    
    uint[] private patientIds;
    uint[] private visitCount;
    
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
        string _patientName, 
        string _patientDoB,
        bool _NewPatient,
        string _patientGenderId,
        string _patientRelationshipStatus,
        string _patientSexuality,
        string _patientPreferredPronoun,
        bool _patientMarried,
        bool _patientSmoker,
        bool _patientAlcohol,
        string _patientAddress,
        string _patientCity,
        string _patientState,
        string _patientZip,
        string _patientCountry,
        string _patientPhoneNo,
        string _patientFamilyHistory,
        string _patientPreExistingConditions,
        string _patientAllergies,
        string _patientMedicationList) only_admin public returns(bool) {
            var _patientData=_patientsData[_patientId];
            //a patient address/ID can be added only once
            if(bytes(_NewPatient == "False")){
                emit Message('This patient has been previously seen here, this will be a duplicate patient. Look at previous blocks with patient ID and privateKey. Visit will be added to visit count.');
                visitCount.increment() ;}
                }
            //Look at stopping the function above when new patient is false.
            
            if(bytes(_patientData.patientName).length==0 && bytes(_patientName).length!=0) {
                 _patientData.patientId= _patientId;
                 _patientData.patientName=_patientName; 
                 _patientData.patientDoB=_patientDoB;
                 _patientData.NewPatient=_NewPatient; 
                 _patientData.patientGenderId=_patientGenderId;
                 _patientData.patientRelationshipStatus=_patientRelationshipStatus;
                 _patientData.patientSexuality=_patientSexuality;
                 _patientData.patientPreferredPronoun=_patientPreferredPronoun;
                 _patientData.patientMarried=_patientMarried;
                 _patientData.patientSmoker=_patientSmoker;
                 _patientData.patientAlcohol=_patientAlcohol;
                 _patientData.patientAddress=_patientAddress;
                 _patientData.patientCity=_patientCity;
                 _patientData.patientState=_patientState;
                 _patientData.patientZip=_patientZip;
                 _patientData.patientCountry=_patientCountry;
                 _patientData.patientPhoneNo=_patientPhoneNo;
                 _patientData.patientFamilyHistory=_patientFamilyHistory;
                 _patientData.patientPreExistingConditions=_patientPreExistingConditions;
                 _patientData.patientMedicationList=_patientMedicationList;}
                 patientIds.push(_patientId)
                 emit Message('A new patient has been added succesfully.');
                 return true;}
            else{
                emit Message('This patient has already been seen here/ this will be a duplicate patient. Look at previous blocks with patient ID and privateKey. Visit will be added to visit count.');
                return false;}
                }

    address payable provider = msg.sender;
    address payable patient; 

    function setReasonForVisit(string memory _chiefComplaint) private returns(string memory) {
        require(provider == msg.sender, "You are not authorized to create or edit medical records!");
        ReasonForVisit = _chiefComplaint;
    }
    function getReasonForVist() private view returns(string memory) {
        return ReasonForVisit;
}
}