import React, { useEffect, useState } from "react";
import axios from "axios";
import TicketList from "./TicketList";
const TicketPage = () => {
  const [error, setError] = useState(`false`);
  const [isLoaded, setLoaded] = useState(false);
  const [ticketData, setTicketData] = useState([]);
  const [isUpdate, setIsUpdate] = useState(true);

  useEffect(() => {
    axios.get("http://localhost:8080/getTicket", {
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
      })
      .then(
        (data) => {
          setLoaded(true);
          setError(false);
          setTicketData(data.data);
          console.log(ticketData);
        },
        (error) => {
          setLoaded(true);
          setError(error);
        }
      );
  },);

  return (
    <div>
      <h1 className="title">Ticket Page</h1>
      <TicketList data={ticketData}/>
    </div>
  );
};
export default TicketPage;
