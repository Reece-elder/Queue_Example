import React from "react";
import CardColumns from "react-bootstrap/CardColumns";
import Ticket from "./Ticket";
const TicketList = ({ data }) => {
  return (
    <CardColumns>
      {data.map((ticket) => (
        <Ticket
          id={ticket.id}
          title={ticket.title}
          description={ticket.description}
          timestamp={ticket.timestamp}
          status={ticket.status}
          author={ticket.author}
        />
      ))}
    </CardColumns>
  );
};
export default TicketList;
