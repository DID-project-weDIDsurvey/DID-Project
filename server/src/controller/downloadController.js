"use strict";

const fs = require("fs");
const multer = require("multer");
const util = require("util");

const upload = multer({ dest: process.cwd() + "/uploads/" });
const { uploadFile, getFile } = require("../middleware/s3");
const unlinkFile = util.promisify(fs.unlink);

const index = async (req, res) => {
    const fileName = req.params.fileName;
    console.log(fileName);
    const readStream = getFile(fileName);

    readStream.pipe(res);
};

const store = (req, res, next) => {
    console.log("store");
    // Remember, the middleware will call it's next function
    // so we can inject our controller manually as the next(

    // /download , upload(), (req, res) ..
    upload.single("attachment")(req, res, async () => {
        const file = req.file;
        const description = req.body.description;

        console.log("file", file);
        console.log("des", description);

        // apply
        // 파일을 서버에 맞게 조정
        // resize (700, 300) (600, 450)
        // 파일의 사이즈를 줄이기
        // img(src (500, 500))

        const result = await uploadFile(file);
        await unlinkFile(file.path);

        console.log(result);

        res.status(200).send({ message: "success!" });
    });
};

const index2 = (req, res) => {
    const fileName = req.params.fileName;

    const filePath =
        "C:/Projects/DID-Project/server/src/uploads/" + `${fileName}`;

    console.log(filePath);

    if (!fs.existsSync(filePath)) {
        console.log("error");

        res.status(404).send({
            error: "Can not found file.",
        });
    } else {
        res.header("Content-Type", `image/png`);
        fs.createReadStream(filePath).pipe(res);
    }
};

module.exports = { index, index2, store };
