import React, { useState } from 'react';
import CreateBuildingModal from './CreateBuildingModal';
import EmptyBody from './EmptyBody';

const [showModal, setShowModal] = useState(true);
function Body() {
  return (
    <div className="h-screen w-full place-items-center  bg-[#1D2125]">
      {showModal ? <CreateBuildingModal /> : <div></div>}
    </div>
  );
}

export { Body };
