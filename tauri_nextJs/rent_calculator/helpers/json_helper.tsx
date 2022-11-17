import {
  BaseDirectory,
  createDir,
  exists,
  writeTextFile,
} from "@tauri-apps/api/fs";

async function CreateJSON(): Promise<void> {
  // const tauriPath = await import("@tauri-apps/api/path");
  // const docDirPath = await tauriPath.documentDir();
  // const saveDataPath = await tauriPath.join(
  //   docDirPath,
  //   "rentCalculatorData.json"
  // );
  try {
    // const doesExist = await exists("rentCalculatorData.json", {
    //   dir: BaseDirectory.Document,
    // });
    await writeTextFile(
      { path: "rentcalculator.json", contents: "[]" },
      {
        dir: BaseDirectory.Document,
      }
    );

    // if (!doesExist) {
    //   await createDataFile();
    // } else {
    //   await createDataFile();
    // }
  } catch (err) {
    console.log(err);
  }

  //   try {
  //     const dbExists = await exists("test.db", { dir: BaseDirectory.Download });
  //     console.log("db:" + dbExists);
  //   } catch (err) {
  //     console.log(err);
  //   }
}

// async function createFolder() {
//   try {
//     await createDir("RentCalculator", {
//       dir: BaseDirectory.Document,
//       recursive: true,
//     });
//   } catch (error) {
//     console.log(error);
//   }
// }

// async function createDataFile() {
//   try {
//   } catch (error) {
//     console.log(error);
//   }
// }

export { CreateJSON };
