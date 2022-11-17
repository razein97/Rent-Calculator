import React from "react";
import { BsPlusSquare } from "react-icons/bs";
import { CreateJSON } from "../helpers/json_helper";

export default function Header() {
  return (
    <div className="sticky top-0 z-30  h-14	 w-full  bg-white p-2 drop-shadow ">
      {/* <AppBarHome /> */}
      <button
        onClick={async () => {
          
        }}
        className=" fixed right-0 justify-center px-4 "
      >
        <BsPlusSquare className="mr-1 h-full w-full hover:text-gray-900" />
      </button>
    </div>
  );
}
