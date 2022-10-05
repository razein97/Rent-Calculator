import { createRequire } from 'module';
import React, { useContext } from 'react';
import { BsPlusLg } from 'react-icons/bs';
import { CreateDB } from '../database_helpers/sqlite_db';

export default function Header() {
  return (
    <header className="sticky top-0 z-30 flex h-12 w-full items-center justify-between bg-[#2a2e32] p-2">
      <div className="  flex w-full justify-between px-2  ">
        <div></div>
        <button onClick={() => {}} className=" rounded-sm bg-white ">
          <BsPlusLg className="h-6 w-6 p-1" />
        </button>
      </div>
    </header>
  );
}
