"use strict";
// data document model setting
const Condition = require("../models/condition");

// 모든 설문지 조건을 가져온다.
const index = (req, res, next) => {
    // query string이 존재할 때
    const surveyId = parseInt(req.query.surveyId);

    if (surveyId) {
        console.log("here");

        // 설문지 id을 기준으로 한 설문지 조건을 가져온다.
        condition
            .findOne({ survey_id: surveyId })
            .then((result) => {
                return res.json({
                    result,
                });
            })
            .catch((error) => {
                return res.json({ message: "Condition Controller Error" });
            });
    } else {
        // query string이 존재하지 않을 때
        console.log("query is empty");

        // 모든 설문지를 가져온다.
        condition
            .find()
            .then((result) => {
                res.json({ result });
            })
            .catch((error) => {
                res.json({ message: "Condition Controller Error !" });
            });
    }
};

// DB에 설문지 조건 추가
const store = (req, res, next) => {
    const conditionObject = req.body;
    // console.log(JSON.stringify(req.body));

    console.log(conditionObject);
    const conditionCollection = new Condition(conditionObject);

    conditionCollection
        .save()
        .then((result) => {
            res.json({
                message: "Data Saved Successfully",
            });
        })
        .catch((error) => {
            res.json({
                message: "Data Upload Error",
            });
        });

    // // 미들웨어
    // if (req.file) {
    //     paper.avatar = req.file.path;
    // }

    // // 파일이 여러개인 경우
    // if (req.files) {
    //     let path = "";
    //     req.files.forEach(function (files, index, arr) {
    //         path = path + files.path + ",";
    //     });
    //     path = path.substring(0, path.lastIndexOf(","));
    //     paper.avatar = path;
    // }
};

// 설문지 조건 업데이트
const update = (req, res, next) => {
    let paperId = req.body.paperId;
    let updatedPaper = req.body.paper;

    Paper.findByIdAndUpdate(paperId, { $set: updatedPaper })
        .then((result) => {
            res.json({
                message: "Paper Updated successfully",
            });
        })
        .catch((error) => {
            res.json({ message: "Paper Controller Error" });
        });
};

const destroy = (req, res, next) => {
    let paperId = req.body.paperId;

    Paper.findByIdAndRemove(paperId)
        .then((result) => {
            res.json({
                message: "Paper Removed successfully",
            });
        })
        .catch((error) => {
            res.json({ message: "Paper Controller Error" });
        });
};

const login = (req, res, next) => {
    var username = req.body.username;
    var password = req.body.password;

    Paper.findOne({ $or: [{ email: username }, { phone: username }] }).then(
        (user) => {
            if (user) {
                // bcrypt.compare(password, user.password, function (err, result) {
                //     if(err) {
                //         res.json {
                //             error : err
                //         }
                //     }
                //     if(result) {
                //         let token = jwt.sign({name: user.name}, 'Secret Value', {expiresIn: '1h'})
                //         res.json({
                //             message: "Login Successful!",
                //             token
                //         })
                //     } else {
                //         res.json({
                //             message: "Password does not matched!"
                //         })
                //     }
                // })
            } else {
                res.json({
                    message: "No user found!",
                });
            }
        }
    );
};

module.exports = { index, store, update, destroy, login };
