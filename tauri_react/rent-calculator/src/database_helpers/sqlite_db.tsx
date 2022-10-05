import { documentDir } from "@tauri-apps/api/path";

import SQLite from "tauri-plugin-sqlite-api";
import { BaseDirectory, createDir, exists } from "@tauri-apps/api/fs";

let db;

async function CreateDB(): Promise<void> {
  const docDir = await documentDir();
  try {
    const doesExist = await exists("RentCalculator", {
      dir: BaseDirectory.Document,
    });
    if (doesExist) {
      db = await SQLite.open(docDir + "/RentCalculator/Data.db");
    } else {
      await createFolder();
      db = await SQLite.open(docDir + "/RentCalculator/Data.db");
    }
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

async function createFolder() {
  try {
    await createDir("RentCalculator", {
      dir: BaseDirectory.Document,
      recursive: true,
    });
  } catch (error) {
    console.log(error);
  }
}

export { CreateDB, db };
