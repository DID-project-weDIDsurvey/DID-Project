"use stirct";
const router = require("express").Router();

// 각 컨트롤러 선언
const conditionController = require("../controller/conditionController");
const surveyController = require("../controller/surveryController");
const completeController = require("../controller/completeController");
const questionController = require("../controller/questionController");
const answerController = require("../controller/answerController");
const downloadController = require("../controller/downloadController");
const tradeController = require("../controller/tradeController");
const mypageController = require("../controller/mypageController");

// 설문지 조건 controller
router.get("/conditions", conditionController.index);
router.post("/condition", conditionController.show);
// router.post("/condition", conditionController.company);

// 설문지 controller
router.get("/surveys", surveyController.index);
router.post("/survey", surveyController.showById);
router.post("/survey/company", surveyController.showByAddress);
router.get("/date", surveyController.showDday);

// 완료된 사람 controller
router.get("/completes", completeController.index);
router.post("/CompletePeople", completeController.saveCompletePeople);
router.post("/reward", completeController.saveReward);

// question controller
router.post("/questions", questionController.showById);

// answer controller
router.post("/answers", answerController.store);

// img call
router.get("/download/:fileName", downloadController.index2);
router.post("/download/:fileName", downloadController.store);

//trade controller
router.get("/trade", tradeController.showGoods);
router.get("/users", tradeController.showUsers);
router.post("/user", tradeController.showUser);
router.post("/exchange", tradeController.exchangeGoods);
router.post("/coupon", tradeController.subtractCoupon);

// mypage controller
router.get("/userGoods", mypageController.showUserGoods);

module.exports = router;
